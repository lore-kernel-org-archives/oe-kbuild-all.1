Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A20563C9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 10:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAdFCSNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697279898; x=1728815898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3TInZUZrMBAn0e9Ry+DRJO/Ebtm/mC4vMQ/dwNxKpz4=;
  b=lAdFCSNoVBRkusvcpk1lH63dvTFavt4SBKF/KJfTJtmEffcIJNBaOGYF
   TFSSBKQcjcKLdUJIWyeiTsLFQopwNR515kGLnr/KkYNyD7L0topzUIq25
   OZ066FNhAOZ0ktpqKVMXiVU/SfqJRGC/T67ae9Z1EGO11V5p0DBjEhOdn
   DOhtodLfyJ/TwrZEjKJNrXOmHDnTnZVK8gWZZ0zQuRWYB84DOD+FM9iOf
   jklZFxhki8J4ePE+ydEJxud3D4l1jy26s/uOELnKq6hbGvP0umiuC3WnB
   eMusqybMyJs3Jh+7V4ID9vSOKnyl6W/C5J4Hlm4mCXWDay4zjDM6H9GEg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="3926770"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="3926770"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 03:38:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="758772687"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="758772687"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Oct 2023 03:38:15 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrc29-000647-2i;
	Sat, 14 Oct 2023 10:38:13 +0000
Date: Sat, 14 Oct 2023 18:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/643 4138/15767] drivers/crypto/caam/jr.c:345:
 warning: Function parameter or member 'idx' not described in
 'caam_jridx_alloc'
Message-ID: <202310141845.50SoKhdw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/643
head:   1fef7a26b48f767bcda4f5147cea10e83903ecf6
commit: c695ba08594ad932569192f1cc72bc240021f39d [4138/15767] crypto: caam - add functionality used by the caam_dma driver
config: arm-randconfig-004-20231014 (https://download.01.org/0day-ci/archive/20231014/202310141845.50SoKhdw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141845.50SoKhdw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141845.50SoKhdw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/caam/jr.c:345: warning: Function parameter or member 'idx' not described in 'caam_jridx_alloc'


vim +345 drivers/crypto/caam/jr.c

   337	
   338	/**
   339	 * caam_jridx_alloc() - Alloc a specific job ring based on its index.
   340	 *
   341	 * returns :  pointer to the newly allocated physical
   342	 *	      JobR dev can be written to if successful.
   343	 **/
   344	struct device *caam_jridx_alloc(int idx)
 > 345	{
   346		struct caam_drv_private_jr *jrpriv;
   347		struct device *dev = ERR_PTR(-ENODEV);
   348	
   349		spin_lock(&driver_data.jr_alloc_lock);
   350	
   351		if (list_empty(&driver_data.jr_list))
   352			goto end;
   353	
   354		list_for_each_entry(jrpriv, &driver_data.jr_list, list_node) {
   355			if (jrpriv->ridx == idx) {
   356				atomic_inc(&jrpriv->tfm_count);
   357				dev = jrpriv->dev;
   358				break;
   359			}
   360		}
   361	
   362	end:
   363		spin_unlock(&driver_data.jr_alloc_lock);
   364		return dev;
   365	}
   366	EXPORT_SYMBOL(caam_jridx_alloc);
   367	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
