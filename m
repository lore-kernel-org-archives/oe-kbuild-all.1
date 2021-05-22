Content-Type: multipart/mixed; boundary="===============8526765213380171267=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] bpf: bpf_timer_init_proto can be static
Date: Sun, 23 May 2021 00:41:14 +0800
Message-ID: <20210522164114.GA59894@51b16008b0d7>
In-Reply-To: <20210520185550.13688-1-alexei.starovoitov@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8526765213380171267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel/bpf/helpers.c:1030:29: warning: symbol 'bpf_timer_init_proto' was no=
t declared. Should it be static?
kernel/bpf/helpers.c:1056:29: warning: symbol 'bpf_timer_mod_proto' was not=
 declared. Should it be static?
kernel/bpf/helpers.c:1081:29: warning: symbol 'bpf_timer_del_proto' was not=
 declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 helpers.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index 8ef0ad23c991ed..053df5380d791d 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -1027,7 +1027,7 @@ BPF_CALL_5(bpf_timer_init, struct bpf_timer *, timer,=
 void *, cb, int, flags,
 	return 0;
 }
 =

-const struct bpf_func_proto bpf_timer_init_proto =3D {
+static const struct bpf_func_proto bpf_timer_init_proto =3D {
 	.func		=3D bpf_timer_init,
 	.gpl_only	=3D false,
 	.ret_type	=3D RET_INTEGER,
@@ -1053,7 +1053,7 @@ BPF_CALL_2(bpf_timer_mod, struct bpf_timer *, timer, =
u64, msecs)
 	return 0;
 }
 =

-const struct bpf_func_proto bpf_timer_mod_proto =3D {
+static const struct bpf_func_proto bpf_timer_mod_proto =3D {
 	.func		=3D bpf_timer_mod,
 	.gpl_only	=3D false,
 	.ret_type	=3D RET_INTEGER,
@@ -1078,7 +1078,7 @@ BPF_CALL_1(bpf_timer_del, struct bpf_timer *, timer)
 	return 0;
 }
 =

-const struct bpf_func_proto bpf_timer_del_proto =3D {
+static const struct bpf_func_proto bpf_timer_del_proto =3D {
 	.func		=3D bpf_timer_del,
 	.gpl_only	=3D false,
 	.ret_type	=3D RET_INTEGER,
--===============8526765213380171267==--

