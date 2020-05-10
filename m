Content-Type: multipart/mixed; boundary="===============0818080255233479308=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH jpirko-mlxsw] rtm_tca_qevent_policy[] can be static
Date: Mon, 11 May 2020 06:41:10 +0800
Message-ID: <20200510224110.GA34640@08a03412e1a9>
In-Reply-To: <202005110619.NnQdBArm%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0818080255233479308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 1ae7b8315f99 ("qevent wip")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 sch_api.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/sched/sch_api.c b/net/sched/sch_api.c
index ecf348a429a6d..861aaccadecb5 100644
--- a/net/sched/sch_api.c
+++ b/net/sched/sch_api.c
@@ -2258,7 +2258,7 @@ static struct sch_qevent_ops *sch_qevent_lookup_ops(s=
truct nlattr *kind)
 =

 	return NULL;
 }
-const struct nla_policy rtm_tca_qevent_policy[TCA_MAX + 1] =3D {
+static const struct nla_policy rtm_tca_qevent_policy[TCA_MAX + 1] =3D {
 	[TCA_KIND]		=3D { .type =3D NLA_STRING },
 	[TCA_DUMP_INVISIBLE]	=3D { .type =3D NLA_FLAG },
 	[TCA_OPTIONS]		=3D { .type =3D NLA_NESTED },
@@ -2267,7 +2267,7 @@ const struct nla_policy rtm_tca_qevent_policy[TCA_MAX=
 + 1] =3D {
 static const u32 sch_qevent_flags =3D TCA_CLS_FLAGS_SKIP_HW |
 				    TCA_CLS_FLAGS_SKIP_SW;
 =

-const struct nla_policy sch_qevent_opts_policy[TCA_MAX + 1] =3D {
+static const struct nla_policy sch_qevent_opts_policy[TCA_MAX + 1] =3D {
 	[TCA_QEVENT_FLAGS]	=3D { .type =3D NLA_BITFIELD32,
 				    .validation_data =3D &sch_qevent_flags },
 	[TCA_QEVENT_ACT]	=3D { .type =3D NLA_NESTED },
--===============0818080255233479308==--

