Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351681FA2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 06:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693549949; x=1725085949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kkMoTiiNvyelW8uy2HrWWOoEVuU8M3x7v15bLT92mKI=;
  b=FBQtuc09sAll7tyhJfFfslhzkSNs3zDquh8hyxTOYd6hzSeZA4SaDm8A
   tyBYLG/WmPWV97Z0vgL5Y2K2QWZfB3BeHHb8hPC6k9ASOEwg5UIySk3xH
   jYOOSpXiWlHH3MBG53tFd2mhW88XzdH7FuDEyqbYnddIylxZheTfnjPCP
   sMP4kHxM+QArAMb+pLfoJjvrQUKO+kzZbE8ytNY1RULajWBnts7i2I1ez
   VNQ9vt38q6o6sDKdvGMooL3r2fgsE1VtMCiAgT2huf7K5F7fgBRusOd3Q
   Hg8QY2ies7LYbnwPvgLworlte22Czc/mjCl9mr5FTEO3J1h+6oA7LHOIY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442542564"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="442542564"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 23:32:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="830014286"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="830014286"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Aug 2023 23:32:28 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbxhi-00010H-08;
	Fri, 01 Sep 2023 06:32:26 +0000
Date: Fri, 1 Sep 2023 14:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 4388/24603] drivers/crypto/caam/jr.c:344:
 warning: Function parameter or member 'idx' not described in
 'caam_jridx_alloc'
Message-ID: <202309011415.vmjjiVOn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: cf6c9073ad386aba7f02cce1ca1d49137b43dbc5 [4388/24603] crypto: caam - add functionality used by the caam_dma driver
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230901/202309011415.vmjjiVOn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011415.vmjjiVOn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011415.vmjjiVOn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/caam/jr.c:344: warning: Function parameter or member 'idx' not described in 'caam_jridx_alloc'


vim +344 drivers/crypto/caam/jr.c

   336	
   337	/**
   338	 * caam_jridx_alloc() - Alloc a specific job ring based on its index.
   339	 *
   340	 * returns :  pointer to the newly allocated physical
   341	 *	      JobR dev can be written to if successful.
   342	 **/
   343	struct device *caam_jridx_alloc(int idx)
 > 344	{
   345		struct caam_drv_private_jr *jrpriv;
   346		struct device *dev = ERR_PTR(-ENODEV);
   347	
   348		spin_lock(&driver_data.jr_alloc_lock);
   349	
   350		if (list_empty(&driver_data.jr_list))
   351			goto end;
   352	
   353		list_for_each_entry(jrpriv, &driver_data.jr_list, list_node) {
   354			if (jrpriv->ridx == idx) {
   355				atomic_inc(&jrpriv->tfm_count);
   356				dev = jrpriv->dev;
   357				break;
   358			}
   359		}
   360	
   361	end:
   362		spin_unlock(&driver_data.jr_alloc_lock);
   363		return dev;
   364	}
   365	EXPORT_SYMBOL(caam_jridx_alloc);
   366	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
