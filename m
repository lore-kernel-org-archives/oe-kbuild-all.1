Content-Type: multipart/mixed; boundary="===============6346515451620259807=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH habanaai] gaudi_queue_type[] can be static
Date: Wed, 06 May 2020 00:23:40 +0800
Message-ID: <20200505162340.GA7356@a8efdcedba90>
In-Reply-To: <202005060022.IrYMjnU9%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6346515451620259807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 01f551e8186d ("add gaudi files")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 gaudi.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/habanalabs/gaudi/gaudi.c b/drivers/misc/habanalab=
s/gaudi/gaudi.c
index 043bd0aeb33cd..6d0ec4e588b5d 100644
--- a/drivers/misc/habanalabs/gaudi/gaudi.c
+++ b/drivers/misc/habanalabs/gaudi/gaudi.c
@@ -437,7 +437,7 @@ gaudi_tpc_interrupts_cause[GAUDI_NUM_OF_TPC_INTR_CAUSE]=
 =3D {
 	"tpc_lbw_bresp_err"
 };
 =

-enum hl_queue_type gaudi_queue_type[GAUDI_QUEUE_ID_SIZE] =3D {
+static enum hl_queue_type gaudi_queue_type[GAUDI_QUEUE_ID_SIZE] =3D {
 	QUEUE_TYPE_EXT, /* GAUDI_QUEUE_ID_DMA_0_0 */
 	QUEUE_TYPE_EXT, /* GAUDI_QUEUE_ID_DMA_0_1 */
 	QUEUE_TYPE_EXT, /* GAUDI_QUEUE_ID_DMA_0_2 */
@@ -4490,7 +4490,7 @@ static int gaudi_cs_parser(struct hl_device *hdev, st=
ruct hl_cs_parser *parser)
 		return gaudi_parse_cb_no_mmu(hdev, parser);
 }
 =

-void gaudi_add_end_of_cb_packets(struct hl_device *hdev, u64 kernel_addres=
s,
+static void gaudi_add_end_of_cb_packets(struct hl_device *hdev, u64 kernel=
_address,
 				u32 len, u64 cq_addr, u32 cq_val, u32 msi_vec,
 				bool eb)
 {
@@ -4524,7 +4524,7 @@ void gaudi_add_end_of_cb_packets(struct hl_device *hd=
ev, u64 kernel_address,
 	cq_pkt->addr =3D cpu_to_le64(CFG_BASE + mmPCIE_MSI_INTR_0 + msi_vec * 4);
 }
 =

-void gaudi_update_eq_ci(struct hl_device *hdev, u32 val)
+static void gaudi_update_eq_ci(struct hl_device *hdev, u32 val)
 {
 	WREG32(mmCPU_IF_EQ_RD_OFFS, val);
 }
--===============6346515451620259807==--

