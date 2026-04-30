Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1CC175A68
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 01:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777514095; cv=none; b=TTvp5Snx9tW903ibUKx/fIyVwZJVvG7cRcLUeOXFQUXeZkFIXrR4ZLHOEuTanlEWJbHbLIEX6/LoSLXtsmUndLI8gWQ+33HL+lBM0pLxbjP6rFfsWZMldWHuvIugKq4War9adeUITs47E4wm/Fh7yGdx0+VOqcAm+sw1Gvfval0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777514095; c=relaxed/simple;
	bh=sP+FjcI5x/tUpeNNj4U/3MdyG488EMWidniJXgvBBVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qPf1grXyR1uGLZA+sQ8NISmahAHB8KNFtpcbDBXLif4XIXQycGAE7ZfSvpvSoVTXhbU+YJ0z0Xu9ipiNJ2p4ZxDrVE5bgQPRFW3Psrrifc/MOgxgX3bxFpqextLLJy7oCBT61RqJzD+5xBlu6xoVuPrFjTEn2xVzTULQbUPozrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vey4jvWW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vey4jvWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777514093; x=1809050093;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sP+FjcI5x/tUpeNNj4U/3MdyG488EMWidniJXgvBBVI=;
  b=Vey4jvWWySWiQyBoEweNNK2SKPgmRFi2uAgDbpW6HZNS1pcIA3+ywC4e
   0g103RIj2FzuPxXTI6cyQc9LIqBsPeQ9kTeBUyncI/ntoyF38rODzKKXL
   iZ5kGJ4L1WjuUyYiXg/k1GaFinrvXwoMkmSMOg0mbFEXiy/s++A+OD97B
   Db2FepUTY06CaYkJ6Y2OQkbgQJc+Ldvan9ieLhuaxb3uJH+ZgxE+11M5R
   SQ288onobzdQNeGYDIHBypuPqifhZrYJzN3PWKVcNAdmSNeDYNyvaHApI
   M0qutUiALKNJW9dTMEyOXkq5whQgJDWoSBzJ0mBvWSyJwfeJPDoVM6H26
   g==;
X-CSE-ConnectionGUID: fdtzT6p9Tvq8LKbWSNciug==
X-CSE-MsgGUID: qX1aMv7/T8iMUHqjEQpDTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="96020891"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="96020891"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 18:54:52 -0700
X-CSE-ConnectionGUID: myihwZSmQl+IGFiW1a9+zg==
X-CSE-MsgGUID: qVWuwGVVQ3aFG7UtndrLCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="231795077"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Apr 2026 18:54:23 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIGbc-00000000Bn8-2SBk;
	Thu, 30 Apr 2026 01:54:20 +0000
Date: Thu, 30 Apr 2026 09:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bitmap_print_to_pagebuf 13/13]
 drivers/fpga/intel-m10-bmc-sec-update.c:186:9: error: call to undeclared
 function 'bitmap_print_to_pagebuf'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202604300957.vQQ9uVE4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/norov/linux bitmap_print_to_pagebuf
head:   09e1bcbc7572ac6d30f74e6f8ff9ea087b259a26
commit: 09e1bcbc7572ac6d30f74e6f8ff9ea087b259a26 [13/13] bitmap: drop bitma=
p_print_to_pagebuf()
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260=
430/202604300957.vQQ9uVE4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260430/202604300957.vQQ9uVE4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300957.vQQ9uVE4-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/fpga/intel-m10-bmc-sec-update.c:186:9: error: call to undeclared=
 function 'bitmap_print_to_pagebuf'; ISO C99 and later do not support impli=
cit function declarations [-Wimplicit-function-declaration]
     186 |         return bitmap_print_to_pagebuf(1, buf, csk_map, CSK_BIT_=
LEN);
         |                ^
   drivers/fpga/intel-m10-bmc-sec-update.c:186:9: note: did you mean 'cpuma=
p_print_to_pagebuf'?
   include/linux/cpumask.h:1316:9: note: 'cpumap_print_to_pagebuf' declared=
 here
    1316 | ssize_t cpumap_print_to_pagebuf(bool list, char *buf, const stru=
ct cpumask *mask);
         |         ^
   1 error generated.


vim +/bitmap_print_to_pagebuf +186 drivers/fpga/intel-m10-bmc-sec-update.c

7f03d84a672d876 Russ Weight   2022-06-06  164 =20
7f03d84a672d876 Russ Weight   2022-06-06  165  static ssize_t
7f03d84a672d876 Russ Weight   2022-06-06  166  show_canceled_csk(struct dev=
ice *dev, u32 addr, char *buf)
7f03d84a672d876 Russ Weight   2022-06-06  167  {
3e10c805b382d0a Ilpo J=C3=A4rvinen 2023-01-16  168  	unsigned int i, size =
=3D CSK_32ARRAY_SIZE * sizeof(u32);
7f03d84a672d876 Russ Weight   2022-06-06  169  	struct m10bmc_sec *sec =3D =
dev_get_drvdata(dev);
7f03d84a672d876 Russ Weight   2022-06-06  170  	DECLARE_BITMAP(csk_map, CSK=
_BIT_LEN);
7f03d84a672d876 Russ Weight   2022-06-06  171  	__le32 csk_le32[CSK_32ARRAY=
_SIZE];
7f03d84a672d876 Russ Weight   2022-06-06  172  	u32 csk32[CSK_32ARRAY_SIZE];
7f03d84a672d876 Russ Weight   2022-06-06  173  	int ret;
7f03d84a672d876 Russ Weight   2022-06-06  174 =20
3e10c805b382d0a Ilpo J=C3=A4rvinen 2023-01-16  175  	ret =3D m10bmc_sec_rea=
d(sec, (u8 *)&csk_le32, addr, size);
7f03d84a672d876 Russ Weight   2022-06-06  176  	if (ret) {
3e10c805b382d0a Ilpo J=C3=A4rvinen 2023-01-16  177  		dev_err(sec->dev, "fa=
iled to read CSK vector\n");
7f03d84a672d876 Russ Weight   2022-06-06  178  		return ret;
7f03d84a672d876 Russ Weight   2022-06-06  179  	}
7f03d84a672d876 Russ Weight   2022-06-06  180 =20
7f03d84a672d876 Russ Weight   2022-06-06  181  	for (i =3D 0; i < CSK_32ARR=
AY_SIZE; i++)
7f03d84a672d876 Russ Weight   2022-06-06  182  		csk32[i] =3D le32_to_cpu((=
(csk_le32[i])));
7f03d84a672d876 Russ Weight   2022-06-06  183 =20
7f03d84a672d876 Russ Weight   2022-06-06  184  	bitmap_from_arr32(csk_map, =
csk32, CSK_BIT_LEN);
7f03d84a672d876 Russ Weight   2022-06-06  185  	bitmap_complement(csk_map, =
csk_map, CSK_BIT_LEN);
7f03d84a672d876 Russ Weight   2022-06-06 @186  	return bitmap_print_to_page=
buf(1, buf, csk_map, CSK_BIT_LEN);
7f03d84a672d876 Russ Weight   2022-06-06  187  }
7f03d84a672d876 Russ Weight   2022-06-06  188 =20

:::::: The code at line 186 was first introduced by commit
:::::: 7f03d84a672d87630448339a8a0e1d689f6980f9 fpga: m10bmc-sec: expose ma=
x10 canceled keys in sysfs

:::::: TO: Russ Weight <russell.h.weight@intel.com>
:::::: CC: Xu Yilun <yilun.xu@intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
