/**
 * facts
 */

package(p1).
package(p2).
package(p3).
package(p4).
package(p5).
package(p7).

depends(p9,p7).
depends(p9,p8).
depends(p7,p5).
depends(p7,p6).
depends(p2,p1).
depends(p4,p3).
depends(p5,p4).
depends(p8,p6).
depends(p6,p4).
depends(p5,p2).