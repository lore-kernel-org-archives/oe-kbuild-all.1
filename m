Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6488A21CC71
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 20:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774125033; cv=none; b=Z+CSwJ8L269QJ8sO5Xce1r9wE59K0CJ73PTpoeM7aEa3jMzPJpRPKoTFy3Udw32SIUQ/TG3VhYfqohxjHoQ9NgkgLYdpJhtziVF5GgH623gPH2/pb8Hal54Rr85cZNYIyCO7wj18lvYioJSQx45LWIZqTOsvJszJOKK8E9inTgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774125033; c=relaxed/simple;
	bh=xjPPpMLbHzFHKxDNLWweCE8/UViZ4VwYl11TkDQIEOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjy5hF2NL8ZJe8XJThiw6B4+6giAtjor7vPQTcCKzJXjYkRpGzzFAD5AVYxtfCzSV6qpbXkonBXTDS5avTiKWc0NYOyEaMFNnWCrhWJZoj+3lN/H8zWg1PcIXsXfqEKkPI12hCoEO/Aqx1isjRbOqjE06Avy8CH2Gfe/A4zD1p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VC4v4pas; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VC4v4pas"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774125031; x=1805661031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xjPPpMLbHzFHKxDNLWweCE8/UViZ4VwYl11TkDQIEOA=;
  b=VC4v4pasP46f1YwE9ObrA5pbNr6cKDV2P3CPQ0NUHcp8nZupNvWXSW83
   WglvwPspQ8612cHBYOAob0d12c8i7gd6wjWxd/X4FXYYXe4mPpQMWJvr/
   UqZnZpCkePiS8lzQJOQuLiU1/3AKodhj5oew2zJ6YgyP7EbZTgZ9gcjDv
   CAtrf/rQ+RpjJrMOdj7LVsXOMQPL7KE9661Czg0rqQYu1MnHNbAdMWyZ3
   hr1GEfTvhlBP/km1OwbrP12gnmAGjGvjdIkGQdlEi7jAtXIzOrDnn2LrC
   ZUi7Hr5K7eSHYbbL6xmEIMuEo/dR0bWbZkJh23hgoiGo1WOq369pzU4w/
   g==;
X-CSE-ConnectionGUID: oow/8veWSbKIxADLjwCZ7Q==
X-CSE-MsgGUID: FJ7BOPfAQ9mOwiOW1FbECg==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="62739190"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="62739190"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 13:30:31 -0700
X-CSE-ConnectionGUID: ishndrsxTF65Sf5W03emyg==
X-CSE-MsgGUID: r2RoSNkdSxOmDukeb54VHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="218885228"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Mar 2026 13:30:28 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w42xS-000000001EX-2GwI;
	Sat, 21 Mar 2026 20:30:12 +0000
Date: Sun, 22 Mar 2026 04:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: Alvin1 Chen <alvin1.chen@lcfc.corp-partner.google.com>,
	dianders@chromium.org, neil.armstrong@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, jesszhan0024@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alvin1 Chen <alvin1.chen@lcfc.corp-partner.google.com>
Subject: Re: [PATCH v3] drm/panel-edp: Add BOE NV153WUM-N42, CMN N153JCA-ELK,
 CSW  MNF307QS3-2
Message-ID: <202603220437.QjSEJJJ9-lkp@intel.com>
References: <20260319050938.556235-1-alvin1.chen@lcfc.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319050938.556235-1-alvin1.chen@lcfc.corp-partner.google.com>

Hi Alvin1,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v7.0-rc4]
[cannot apply to next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alvin1-Chen/drm-panel-edp-Add-BOE-NV153WUM-N42-CMN-N153JCA-ELK-CSW-MNF307QS3-2/20260320-084718
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260319050938.556235-1-alvin1.chen%40lcfc.corp-partner.google.com
patch subject: [PATCH v3] drm/panel-edp: Add BOE NV153WUM-N42, CMN N153JCA-ELK, CSW  MNF307QS3-2
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260322/202603220437.QjSEJJJ9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603220437.QjSEJJJ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603220437.QjSEJJJ9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-edp.c:1893:1: error: expected expression before '{' token
    1893 | { \
         | ^
   drivers/gpu/drm/panel/panel-edp.c:2028:9: note: in expansion of macro 'EDP_PANEL_ENTRY'
    2028 | +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0db3, &delay_200_500_e80, "NV153WUM-N42"),
         |         ^~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-edp.c:1885:33: warning: 'delay_80_500_e50_d50' defined but not used [-Wunused-const-variable=]
    1885 | static const struct panel_delay delay_80_500_e50_d50 = {
         |                                 ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-edp.c:1878:33: warning: 'delay_200_500_e50_d100' defined but not used [-Wunused-const-variable=]
    1878 | static const struct panel_delay delay_200_500_e50_d100 = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-edp.c:1870:33: warning: 'delay_50_500_e200_d200_po2e335' defined but not used [-Wunused-const-variable=]
    1870 | static const struct panel_delay delay_50_500_e200_d200_po2e335 = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-edp.c:1864:33: warning: 'delay_200_500_e250' defined but not used [-Wunused-const-variable=]
    1864 | static const struct panel_delay delay_200_500_e250 = {
         |                                 ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-edp.c:1858:33: warning: 'delay_200_150_e50' defined but not used [-Wunused-const-variable=]
    1858 | static const struct panel_delay delay_200_150_e50 = {
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-edp.c:1838:33: warning: 'delay_200_500_e200_d50' defined but not used [-Wunused-const-variable=]
    1838 | static const struct panel_delay delay_200_500_e200_d50 = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-edp.c:1831:33: warning: 'delay_200_500_e200_d10' defined but not used [-Wunused-const-variable=]
    1831 | static const struct panel_delay delay_200_500_e200_d10 = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-edp.c:1824:33: warning: 'delay_200_500_e200_d200' defined but not used [-Wunused-const-variable=]
    1824 | static const struct panel_delay delay_200_500_e200_d200 = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-edp.c:1805:33: warning: 'delay_100_500_e200' defined but not used [-Wunused-const-variable=]
    1805 | static const struct panel_delay delay_100_500_e200 = {
         |                                 ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-edp.c:1798:33: warning: 'delay_80_500_e80_p2e200' defined but not used [-Wunused-const-variable=]
    1798 | static const struct panel_delay delay_80_500_e80_p2e200 = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-edp.c:1792:33: warning: 'delay_80_500_e50' defined but not used [-Wunused-const-variable=]
    1792 | static const struct panel_delay delay_80_500_e50 = {
         |                                 ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-edp.c:1771:33: warning: 'delay_200_500_e50_d50_p2e200' defined but not used [-Wunused-const-variable=]
    1771 | static const struct panel_delay delay_200_500_e50_d50_p2e200 = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-edp.c:1753:33: warning: 'delay_200_500_p2e100' defined but not used [-Wunused-const-variable=]
    1753 | static const struct panel_delay delay_200_500_p2e100 = {
         |                                 ^~~~~~~~~~~~~~~~~~~~


vim +1893 drivers/gpu/drm/panel/panel-edp.c

490b30fbaca2abb Zhongtian Wu     2025-09-08  1891  
7d1be0a09fa6213 Douglas Anderson 2021-09-24  1892  #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
5540cf8f3e8dac7 Douglas Anderson 2021-09-14 @1893  { \
bf201127c1b8f26 Hsin-Yi Wang     2024-03-07  1894  	.ident = { \
5540cf8f3e8dac7 Douglas Anderson 2021-09-14  1895  		.name = _name, \
7d1be0a09fa6213 Douglas Anderson 2021-09-24  1896  		.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, \
7d1be0a09fa6213 Douglas Anderson 2021-09-24  1897  						     product_id), \
bf201127c1b8f26 Hsin-Yi Wang     2024-03-07  1898  	}, \
5540cf8f3e8dac7 Douglas Anderson 2021-09-14  1899  	.delay = _delay \
5540cf8f3e8dac7 Douglas Anderson 2021-09-14  1900  }
5540cf8f3e8dac7 Douglas Anderson 2021-09-14  1901  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
