Content-Type: multipart/mixed; boundary="===============5190026079204517791=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [shenki:dev-5.7 39/126] drivers/misc/npcm7xx-lpc-bpc.c:105:22: sparse: sparse: invalid assignment: |=
Date: Wed, 06 May 2020 12:08:43 +0800
Message-ID: <202005061240.zbv8lgqV%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5190026079204517791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/shenki/linux dev-5.7
head:   90ccb573c22c54ec2240a2991cdbba40e1e1c837
commit: 8aa4062aef428d60d1bacfef28cc38e901b4f5b0 [39/126] misc: npcm7xx-lpc=
-bpc: add NPCM7xx BIOS post code driver
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout 8aa4062aef428d60d1bacfef28cc38e901b4f5b0
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/misc/npcm7xx-lpc-bpc.c:105:22: sparse: sparse: invalid assignmen=
t: |=3D
>> drivers/misc/npcm7xx-lpc-bpc.c:105:22: sparse:    left side has type res=
tricted __poll_t
>> drivers/misc/npcm7xx-lpc-bpc.c:105:22: sparse:    right side has type int
   drivers/misc/npcm7xx-lpc-bpc.c:108:22: sparse: sparse: invalid assignmen=
t: |=3D
   drivers/misc/npcm7xx-lpc-bpc.c:108:22: sparse:    left side has type res=
tricted __poll_t
   drivers/misc/npcm7xx-lpc-bpc.c:108:22: sparse:    right side has type int

vim +105 drivers/misc/npcm7xx-lpc-bpc.c

    96	=

    97	static __poll_t npcm7xx_bpc_poll(struct file *file,
    98					 struct poll_table_struct *pt)
    99	{
   100		struct npcm7xx_bpc_channel *chan =3D npcm7xx_file_to_ch(file);
   101		__poll_t mask =3D 0;
   102	=

   103		poll_wait(file, &chan->wq, pt);
   104		if (!kfifo_is_empty(&chan->fifo))
 > 105			mask |=3D POLLIN;
   106	=

   107		if (chan->host_reset) {
   108			mask |=3D POLLHUP;
   109			chan->host_reset =3D false;
   110		}
   111	=

   112		return mask;
   113	}
   114	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5190026079204517791==--

