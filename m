Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B1613ACD
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jan 2024 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzFdMu4B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704645093; x=1736181093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=URP0nqHM2/KQhWTGj8eeZ1Ls1tA2I/C1BE0k0cWvQEU=;
  b=mzFdMu4BYg9ZdI2n1Li8/ufofb3Wo/YschqA+WjsPlZrArykvJHsYbJG
   arFoa38HZLeBJG8c9EMer7vELu7WcylUfaFIy+g8+bT3L3P4q+FR4cVUr
   ofiOy+6nQnE61jxbc59014A4+GNgqi6QnEsRdxIdy4kRyY8/dmjoeU67E
   1vw/2qDgy3NYMHaAem7SHYQI9MT8hGyQyt4ettAxAa2O3aXEW2oqbYtut
   //Z8RV2cfICqphPNrhPtFt0lygX4R1svqKkkVUJOj3ds7Gi79qDYXeBng
   29SjDQ9uiiaDPjzBdsgNTspOmEbpkYLoKdt310zKLXtoGuEXr8d9bvt7Q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="396627376"
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; 
   d="scan'208";a="396627376"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 08:31:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="871671331"
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; 
   d="scan'208";a="871671331"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Jan 2024 08:31:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMW3d-0003wC-22;
	Sun, 07 Jan 2024 16:31:29 +0000
Date: Mon, 8 Jan 2024 00:31:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 59/66] drivers/video/console/vgacon.c:1209:27:
 error: initialization of 'bool (*)(struct vc_data *)' {aka '_Bool (*)(struct
 vc_data *)'} from incompatible pointer type 'int (*)(struct vc_data *)'
Message-ID: <202401080033.qAVoM95I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   437c218ee88e00a08e97c7835435068074c4d32f
commit: c177003db531e66faa7aff4128daaca50e580606 [59/66] sanitize con_set_origin
config: i386-randconfig-013-20240107 (https://download.01.org/0day-ci/archive/20240108/202401080033.qAVoM95I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401080033.qAVoM95I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401080033.qAVoM95I-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/console/vgacon.c:1209:27: error: initialization of 'bool (*)(struct vc_data *)' {aka '_Bool (*)(struct vc_data *)'} from incompatible pointer type 'int (*)(struct vc_data *)' [-Werror=incompatible-pointer-types]
    1209 |         .con_set_origin = vgacon_set_origin,
         |                           ^~~~~~~~~~~~~~~~~
   drivers/video/console/vgacon.c:1209:27: note: (near initialization for 'vga_con.con_set_origin')
   cc1: some warnings being treated as errors


vim +1209 drivers/video/console/vgacon.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  1183  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1184  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  1185   *  The console `switch' structure for the VGA based console
^1da177e4c3f41 Linus Torvalds    2005-04-16  1186   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1187  
4918832d814b33 Jiri Slaby (SUSE  2023-05-29  1188) static void vgacon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
4918832d814b33 Jiri Slaby (SUSE  2023-05-29  1189) 			 unsigned int width) { }
775ef630c10747 Jiri Slaby (SUSE  2023-12-07  1190) static void vgacon_putcs(struct vc_data *vc, const u16 *s, unsigned int count,
775ef630c10747 Jiri Slaby (SUSE  2023-12-07  1191) 			 unsigned int ypos, unsigned int xpos) { }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1192  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1193  const struct consw vga_con = {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1194  	.owner = THIS_MODULE,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1195  	.con_startup = vgacon_startup,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1196  	.con_init = vgacon_init,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1197  	.con_deinit = vgacon_deinit,
c396a5bf457fb6 Kees Cook         2018-02-26  1198  	.con_clear = vgacon_clear,
c396a5bf457fb6 Kees Cook         2018-02-26  1199  	.con_putcs = vgacon_putcs,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1200  	.con_cursor = vgacon_cursor,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1201  	.con_scroll = vgacon_scroll,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1202  	.con_switch = vgacon_switch,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1203  	.con_blank = vgacon_blank,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1204  	.con_font_set = vgacon_font_set,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1205  	.con_font_get = vgacon_font_get,
28254d439b8c65 Samuel Thibault   2005-09-09  1206  	.con_resize = vgacon_resize,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1207  	.con_set_palette = vgacon_set_palette,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1208  	.con_scrolldelta = vgacon_scrolldelta,
^1da177e4c3f41 Linus Torvalds    2005-04-16 @1209  	.con_set_origin = vgacon_set_origin,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1210  	.con_save_screen = vgacon_save_screen,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1211  	.con_build_attr = vgacon_build_attr,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1212  	.con_invert_region = vgacon_invert_region,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1213  };
a4de05268e674e Daniel Vetter     2014-06-05  1214  EXPORT_SYMBOL(vga_con);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1215  

:::::: The code at line 1209 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
