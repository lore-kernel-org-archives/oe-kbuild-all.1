Content-Type: multipart/mixed; boundary="===============0506858588420157794=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] jbd2, ext4: jbd2_journal_shrink_scan() can be static
Date: Fri, 28 May 2021 02:25:42 +0800
Message-ID: <20210527182542.GA12319@d3094bb37a70>
In-Reply-To: <20210527135641.420514-6-yi.zhang@huawei.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0506858588420157794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

fs/jbd2/journal.c:1963:15: warning: symbol 'jbd2_journal_shrink_scan' was n=
ot declared. Should it be static?
fs/jbd2/journal.c:1987:15: warning: symbol 'jbd2_journal_shrink_count' was =
not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 journal.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/jbd2/journal.c b/fs/jbd2/journal.c
index cfad32036857e..491c311dabec1 100644
--- a/fs/jbd2/journal.c
+++ b/fs/jbd2/journal.c
@@ -1960,8 +1960,8 @@ int jbd2_journal_load(journal_t *journal)
  * Scan the checkpointed buffer on the checkpoint list and release the
  * journal_head.
  */
-unsigned long jbd2_journal_shrink_scan(struct shrinker *shrink,
-				       struct shrink_control *sc)
+static unsigned long jbd2_journal_shrink_scan(struct shrinker *shrink,
+					      struct shrink_control *sc)
 {
 	journal_t *journal =3D container_of(shrink, journal_t, j_shrinker);
 	unsigned long nr_to_scan =3D sc->nr_to_scan;
@@ -1984,8 +1984,8 @@ unsigned long jbd2_journal_shrink_scan(struct shrinke=
r *shrink,
  *
  * Count the number of checkpoint buffers on the checkpoint list.
  */
-unsigned long jbd2_journal_shrink_count(struct shrinker *shrink,
-					struct shrink_control *sc)
+static unsigned long jbd2_journal_shrink_count(struct shrinker *shrink,
+					       struct shrink_control *sc)
 {
 	journal_t *journal =3D container_of(shrink, journal_t, j_shrinker);
 	unsigned long count;
--===============0506858588420157794==--

