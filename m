Content-Type: multipart/mixed; boundary="===============3508542558472186612=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: kernel/trace/bpf_trace.c:1181:23: warning: Uninitialized variable: t
Date: Sat, 31 Oct 2020 13:49:17 +0800
Message-ID: <202010311312.RRUikhQ7-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3508542558472186612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5fc6b075e165f641fbc366b58b578055762d5f8c
commit: c4d0bfb45068d853a478b9067a95969b1886a30f bpf: Add bpf_snprintf_btf =
helper
date:   5 weeks ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
>> kernel/trace/bpf_trace.c:1181:23: warning: Uninitialized variable: t [un=
initvar]
    if (*btf_id <=3D 0 || !t)
                         ^

vim +1181 kernel/trace/bpf_trace.c

  1153	=

  1154	#define BTF_F_ALL	(BTF_F_COMPACT  | BTF_F_NONAME | \
  1155				 BTF_F_PTR_RAW | BTF_F_ZERO)
  1156	=

  1157	static int bpf_btf_printf_prepare(struct btf_ptr *ptr, u32 btf_ptr_s=
ize,
  1158					  u64 flags, const struct btf **btf,
  1159					  s32 *btf_id)
  1160	{
  1161		const struct btf_type *t;
  1162	=

  1163		if (unlikely(flags & ~(BTF_F_ALL)))
  1164			return -EINVAL;
  1165	=

  1166		if (btf_ptr_size !=3D sizeof(struct btf_ptr))
  1167			return -EINVAL;
  1168	=

  1169		*btf =3D bpf_get_btf_vmlinux();
  1170	=

  1171		if (IS_ERR_OR_NULL(*btf))
  1172			return PTR_ERR(*btf);
  1173	=

  1174		if (ptr->type_id > 0)
  1175			*btf_id =3D ptr->type_id;
  1176		else
  1177			return -EINVAL;
  1178	=

  1179		if (*btf_id > 0)
  1180			t =3D btf_type_by_id(*btf, *btf_id);
> 1181		if (*btf_id <=3D 0 || !t)
  1182			return -ENOENT;
  1183	=

  1184		return 0;
  1185	}
  1186	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3508542558472186612==--

