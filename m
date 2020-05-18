Content-Type: multipart/mixed; boundary="===============0827251526844537781=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [balbi-usb:testing/fixes 2/8] WARNING: simple_strtoul is obsolete, use kstrtoul instead
Date: Mon, 18 May 2020 11:33:19 +0800
Message-ID: <20200518033319.GC24805@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0827251526844537781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git testi=
ng/fixes
head:   172b14b48ca10b280482b164506892ea09edb946
commit: 97df5e5758f7d1dd0ca97e3210696818fc45bdb3 [2/8] usb: raw-gadget: fix=
 gadget endpoint selection

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

scripts/checkpatch.pl 0001-usb-raw-gadget-fix-gadget-endpoint-selection.pat=
ch
# many are suggestions rather than must-fix

WARNING: simple_strtoul is obsolete, use kstrtoul instead
#123: drivers/usb/gadget/legacy/raw_gadget.c:261:
+		return simple_strtoul(&name[2], NULL, 10);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0827251526844537781==--

