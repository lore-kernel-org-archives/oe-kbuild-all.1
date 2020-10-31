Content-Type: multipart/mixed; boundary="===============0485005676792634747=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] bpf: bpf_get_current_task_btf_proto can be static
Date: Sun, 01 Nov 2020 02:45:03 +0800
Message-ID: <20201031184503.GA18952@1ec460b3ae4c>
In-Reply-To: <20201027170317.2011119-3-kpsingh@chromium.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0485005676792634747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kernel test robot <lkp@intel.com>
---
 bpf_trace.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
index 7b48aa1c695ab8..e4515b0f62a8d3 100644
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -1029,7 +1029,7 @@ BPF_CALL_0(bpf_get_current_task_btf)
 =

 BTF_ID_LIST_SINGLE(bpf_get_current_btf_ids, struct, task_struct)
 =

-const struct bpf_func_proto bpf_get_current_task_btf_proto =3D {
+static const struct bpf_func_proto bpf_get_current_task_btf_proto =3D {
 	.func		=3D bpf_get_current_task_btf,
 	.gpl_only	=3D true,
 	.ret_type	=3D RET_PTR_TO_BTF_ID,
--===============0485005676792634747==--

