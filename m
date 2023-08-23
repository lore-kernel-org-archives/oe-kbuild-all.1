Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F7C1C3F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 21:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692825191; x=1724361191;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hsPV0IWrvcwAdVIoHe48MswaQrcD8PgALgWJa1OzhB0=;
  b=iu0YNwa8Q7V7oMIkjHbna2F1ns9KBGWjKU/GQa2z6ndybtWhAPStY07z
   IJszeo3U91dgiE2A5rAjKB2vviENH5xtwXfd8mAvent6VaHvpwqJHoWIf
   MdyHMPPR4NFSGIa8ANkMyEtR97TPe0fi6YGuTQA9680tag75gobmr5Bbk
   KrpDD0n6WE/qO3Ebvz6lpf8R56DQ+pj4xQoYn3DRS1qTPpLQh82yBonYh
   NRMlG8SKoEP2YEq/chKEyKFo+l7OO1bWiOQISB2qYcy2qp5QT95KGkBvC
   IcaiV7ZJIiEC2g6SUT5/kuvZPSRFbzVD3ZdTJHYq/K2xxYcTVpse7n0cK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="378026733"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="378026733"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 14:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="736804040"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="736804040"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 23 Aug 2023 14:13:07 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYvA2-0001Vv-0m;
	Wed, 23 Aug 2023 21:13:06 +0000
Date: Thu, 24 Aug 2023 05:12:27 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [linux-next:master 10640/12208]
 drivers/gpu/drm/i915/display/intel_tc.c:1845:11: error: '%d' directive
 output may be truncated writing between 1 and 11 bytes into a region of size
 3
Message-ID: <202308240556.jFbsuVxg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3f80d3eae76c3557b3c9b5938ad01c0e6cf25ec
commit: 6d4ab2e97dcfbcd748ae71761a9d8e5e41cc732c [10640/12208] extrawarn: enable format and stringop overflow warnings in W=1
config: x86_64-randconfig-071-20230824 (https://download.01.org/0day-ci/archive/20230824/202308240556.jFbsuVxg-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240556.jFbsuVxg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240556.jFbsuVxg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_tc.c: In function 'intel_tc_port_init':
>> drivers/gpu/drm/i915/display/intel_tc.c:1845:11: error: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 3 [-Werror=format-truncation=]
       "%c/TC#%d", port_name(port), tc_port + 1);
              ^~
   drivers/gpu/drm/i915/display/intel_tc.c:1845:4: note: directive argument in the range [-2147483647, 2147483647]
       "%c/TC#%d", port_name(port), tc_port + 1);
       ^~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_tc.c:1844:2: note: 'snprintf' output between 7 and 17 bytes into a destination of size 8
     snprintf(tc->port_name, sizeof(tc->port_name),
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       "%c/TC#%d", port_name(port), tc_port + 1);
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +1845 drivers/gpu/drm/i915/display/intel_tc.c

bc85328ff431e4 Imre Deak     2019-06-28  1817  
c5879999641f78 Imre Deak     2023-03-23  1818  int intel_tc_port_init(struct intel_digital_port *dig_port, bool is_legacy)
ab7bc4e1a5508e Imre Deak     2019-06-28  1819  {
ab7bc4e1a5508e Imre Deak     2019-06-28  1820  	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
c5879999641f78 Imre Deak     2023-03-23  1821  	struct intel_tc_port *tc;
ab7bc4e1a5508e Imre Deak     2019-06-28  1822  	enum port port = dig_port->base.port;
ab7bc4e1a5508e Imre Deak     2019-06-28  1823  	enum tc_port tc_port = intel_port_to_tc(i915, port);
ab7bc4e1a5508e Imre Deak     2019-06-28  1824  
320c670c048d3b Ville Syrjälä 2020-10-28  1825  	if (drm_WARN_ON(&i915->drm, tc_port == TC_PORT_NONE))
c5879999641f78 Imre Deak     2023-03-23  1826  		return -EINVAL;
ab7bc4e1a5508e Imre Deak     2019-06-28  1827  
c5879999641f78 Imre Deak     2023-03-23  1828  	tc = kzalloc(sizeof(*tc), GFP_KERNEL);
c5879999641f78 Imre Deak     2023-03-23  1829  	if (!tc)
c5879999641f78 Imre Deak     2023-03-23  1830  		return -ENOMEM;
c5879999641f78 Imre Deak     2023-03-23  1831  
c5879999641f78 Imre Deak     2023-03-23  1832  	dig_port->tc = tc;
3eafcddf766b6b Imre Deak     2023-03-23  1833  	tc->dig_port = dig_port;
3eafcddf766b6b Imre Deak     2023-03-23  1834  
6f0423b06a0cd5 Mika Kahola   2023-04-28  1835  	if (DISPLAY_VER(i915) >= 14)
6f0423b06a0cd5 Mika Kahola   2023-04-28  1836  		tc->phy_ops = &xelpdp_tc_phy_ops;
6f0423b06a0cd5 Mika Kahola   2023-04-28  1837  	else if (DISPLAY_VER(i915) >= 13)
34a658b7e7128b Imre Deak     2023-03-23  1838  		tc->phy_ops = &adlp_tc_phy_ops;
16cf693e31bdb4 Imre Deak     2023-03-23  1839  	else if (DISPLAY_VER(i915) >= 12)
16cf693e31bdb4 Imre Deak     2023-03-23  1840  		tc->phy_ops = &tgl_tc_phy_ops;
34a658b7e7128b Imre Deak     2023-03-23  1841  	else
34a658b7e7128b Imre Deak     2023-03-23  1842  		tc->phy_ops = &icl_tc_phy_ops;
34a658b7e7128b Imre Deak     2023-03-23  1843  
3eafcddf766b6b Imre Deak     2023-03-23  1844  	snprintf(tc->port_name, sizeof(tc->port_name),
ab7bc4e1a5508e Imre Deak     2019-06-28 @1845  		 "%c/TC#%d", port_name(port), tc_port + 1);
ab7bc4e1a5508e Imre Deak     2019-06-28  1846  
3eafcddf766b6b Imre Deak     2023-03-23  1847  	mutex_init(&tc->lock);
c598c335da4207 Imre Deak     2023-05-12  1848  	/* TODO: Combine the two works */
3eafcddf766b6b Imre Deak     2023-03-23  1849  	INIT_DELAYED_WORK(&tc->disconnect_phy_work, intel_tc_port_disconnect_phy_work);
c598c335da4207 Imre Deak     2023-05-12  1850  	INIT_DELAYED_WORK(&tc->link_reset_work, intel_tc_port_link_reset_work);
3eafcddf766b6b Imre Deak     2023-03-23  1851  	tc->legacy_port = is_legacy;
3eafcddf766b6b Imre Deak     2023-03-23  1852  	tc->mode = TC_PORT_DISCONNECTED;
3eafcddf766b6b Imre Deak     2023-03-23  1853  	tc->link_refcount = 0;
c55b73f391a726 Imre Deak     2023-03-23  1854  
c55b73f391a726 Imre Deak     2023-03-23  1855  	tc_phy_init(tc);
a82796a2e332d1 Imre Deak     2022-09-22  1856  
a82796a2e332d1 Imre Deak     2022-09-22  1857  	intel_tc_port_init_mode(dig_port);
c5879999641f78 Imre Deak     2023-03-23  1858  
c5879999641f78 Imre Deak     2023-03-23  1859  	return 0;
c5879999641f78 Imre Deak     2023-03-23  1860  }
c5879999641f78 Imre Deak     2023-03-23  1861  

:::::: The code at line 1845 was first introduced by commit
:::::: ab7bc4e1a5508e5cb974985fba325d80086b3f10 drm/i915: Unify the TypeC port notation in debug/error messages

:::::: TO: Imre Deak <imre.deak@intel.com>
:::::: CC: Imre Deak <imre.deak@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
