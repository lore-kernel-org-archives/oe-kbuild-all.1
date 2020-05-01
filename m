Content-Type: multipart/mixed; boundary="===============9088649995246179735=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] ext4: __pcpu_scope_discard_pa_seq can be static
Date: Sat, 02 May 2020 02:07:25 +0800
Message-ID: <20200501180725.GA34212@3f1446aad593>
In-Reply-To: <65959db57fa53e5d3d63099b0d5c039ab1154253.1588313626.git.riteshh@linux.ibm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9088649995246179735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 mballoc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/mballoc.c b/fs/ext4/mballoc.c
index 6bb08bb3c0cee..462ddad104315 100644
--- a/fs/ext4/mballoc.c
+++ b/fs/ext4/mballoc.c
@@ -375,7 +375,7 @@ static void ext4_mb_generate_from_freelist(struct super=
_block *sb, void *bitmap,
  * below function ext4_get_discard_pa_seq_sum(). This happens after making
  * sure that all the PAs on grp->bb_prealloc_list got freed.
  */
-DEFINE_PER_CPU(u64, discard_pa_seq);
+static DEFINE_PER_CPU(u64, discard_pa_seq);
 static inline u64 ext4_get_discard_pa_seq_sum(void)
 {
 	int __cpu;
--===============9088649995246179735==--

