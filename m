Content-Type: multipart/mixed; boundary="===============2847668065367306989=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 15/34] staging: mmal-vchiq: Use vc-sm-cma to support zero copy
Date: Wed, 06 May 2020 00:07:37 +0800
Message-ID: <202005060033.fVqn7hFL%lkp@intel.com>
In-Reply-To: <20200504092611.9798-16-laurent.pinchart@ideasonboard.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2847668065367306989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.7-rc4]
[cannot apply to linuxtv-media/master anholt/for-next next-20200505]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Laurent-Pinchart/Drivers-f=
or-the-BCM283x-CSI-2-CCP2-receiver-and-ISP/20200505-054310
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
9851a0dee7c28514f149f7e4f60ec1b06286cc1b
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1796:36: sparse: s=
parse: Using plain integer as NULL pointer
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:472:48: sparse: sp=
arse: non size-preserving integer to pointer cast

vim +1796 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c

  1779	=

  1780	int mmal_vchi_buffer_cleanup(struct mmal_buffer *buf)
  1781	{
  1782		struct mmal_msg_context *msg_context =3D buf->msg_context;
  1783	=

  1784		if (msg_context)
  1785			release_msg_context(msg_context);
  1786		buf->msg_context =3D NULL;
  1787	=

  1788		if (buf->vcsm_handle) {
  1789			int ret;
  1790	=

  1791			pr_debug("%s: vc_sm_cma_free on handle %p\n", __func__,
  1792				 buf->vcsm_handle);
  1793			ret =3D vc_sm_cma_free(buf->vcsm_handle);
  1794			if (ret)
  1795				pr_err("%s: vcsm_free failed, ret %d\n", __func__, ret);
> 1796			buf->vcsm_handle =3D 0;
  1797		}
  1798		return 0;
  1799	}
  1800	EXPORT_SYMBOL_GPL(mmal_vchi_buffer_cleanup);
  1801	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2847668065367306989==--

