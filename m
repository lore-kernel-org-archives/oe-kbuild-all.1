Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB69200DD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 19:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QmUmTIzq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699556908; x=1731092908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N2U3lihXEgezvp6tcNHXAn6Q/8DYyp5SJuVpKZyx4lY=;
  b=QmUmTIzqA5UyMLSVyTQslBd6lksaYlDGUHzDjdRekGcl7ygx6JgfMZIR
   8CN0QgVeRKHbsnN0Lpn5xOJISZo0P0Op+OdAdBxcrslNGuDPisn1pIynY
   U+BlxXTPc+/asNUnj0Pyb9e+7AVnTBzxJjjVFyWMHtYR5rotxpj2jZMZT
   Oh3qVlAo4lv5kOO239Zj1TmNjDPqB8WRzWcEH4hAoJAXMluAO6EvPotKy
   nqfXFhn/N9vADXo5c/GjlKrLgt8EXaPijdEaksJwrQiZD5lHjlh1+bBMn
   2/HKXLN+hWu4iG6Oql/WDYo7KCd0bmn3iRTW2kABg2h3CDMESGuNBI/lO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="476286343"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="476286343"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 11:08:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="833929222"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="833929222"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2023 11:08:01 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ANj-00094c-0h;
	Thu, 09 Nov 2023 19:07:59 +0000
Date: Fri, 10 Nov 2023 03:07:45 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Machata <petrm@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Ido Schimmel <idosch@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 31/51]
 drivers/net/ethernet/mellanox/mlxsw/spectrum_fid.c:1856:6: warning: no
 previous prototype for 'mlxsw_sp_fids_fini'
Message-ID: <202311100350.c7NlKiSV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   0e0c63cf67fb4739960a06ead418546d84718af5
commit: 269a2f6aa3bc2e123144e9c3778b719a874d71fe [31/51] mlxsw: spectrum_fid: Privatize FID families
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231110/202311100350.c7NlKiSV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100350.c7NlKiSV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100350.c7NlKiSV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlxsw/spectrum_fid.c:1856:6: warning: no previous prototype for 'mlxsw_sp_fids_fini' [-Wmissing-prototypes]
    1856 | void mlxsw_sp_fids_fini(struct mlxsw_sp *mlxsw_sp)
         |      ^~~~~~~~~~~~~~~~~~


vim +/mlxsw_sp_fids_fini +1856 drivers/net/ethernet/mellanox/mlxsw/spectrum_fid.c

a110748725450ad Ido Schimmel 2017-05-26  1855  
a110748725450ad Ido Schimmel 2017-05-26 @1856  void mlxsw_sp_fids_fini(struct mlxsw_sp *mlxsw_sp)
a110748725450ad Ido Schimmel 2017-05-26  1857  {
a110748725450ad Ido Schimmel 2017-05-26  1858  	struct mlxsw_sp_fid_core *fid_core = mlxsw_sp->fid_core;
a110748725450ad Ido Schimmel 2017-05-26  1859  	int i;
a110748725450ad Ido Schimmel 2017-05-26  1860  
a110748725450ad Ido Schimmel 2017-05-26  1861  	for (i = 0; i < MLXSW_SP_FID_TYPE_MAX; i++)
a110748725450ad Ido Schimmel 2017-05-26  1862  		mlxsw_sp_fid_family_unregister(mlxsw_sp,
a110748725450ad Ido Schimmel 2017-05-26  1863  					       fid_core->fid_family_arr[i]);
a110748725450ad Ido Schimmel 2017-05-26  1864  	kfree(fid_core->port_fid_mappings);
d3d19d4b8ca2efb Ido Schimmel 2018-10-17  1865  	rhashtable_destroy(&fid_core->vni_ht);
5d44a712e6af878 Ido Schimmel 2018-11-21  1866  	rhashtable_destroy(&fid_core->fid_ht);
a110748725450ad Ido Schimmel 2017-05-26  1867  	kfree(fid_core);
a110748725450ad Ido Schimmel 2017-05-26  1868  }
269a2f6aa3bc2e1 Petr Machata 2023-11-08  1869  

:::::: The code at line 1856 was first introduced by commit
:::::: a110748725450adb86cb4b20b24dd8c4e0cc2d8f mlxsw: spectrum: Implement common FID core

:::::: TO: Ido Schimmel <idosch@mellanox.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
