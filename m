Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7381A1DACB8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 18:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731867308; cv=none; b=dnDqy7rtV5Myw0rJ5EmdsEHmDa2Zg8HauBT4WL2fg04RRgkgHbO/l12Y6BhCg3nQzFkNeUhn9fkBJAFH0mZ1mWT2qBcRKc+rJm9SRIpLf4+sIrgOq+edjDUU0ugKhV/f1SW7UoNLoIXegFH0RreTOaSwccYlr003SYNzVphpPDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731867308; c=relaxed/simple;
	bh=1Xr2UX8X1LoxjYuek3zWpQOeqFH0VjQ0KCIvb0cUJ74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ev8bYuPZkybC+9TKoBJ8O8zjOGb9BSO2Im6K2t+elapFEDGLTY2LkuGH+ki8Sft8Fgegh9eyL2+wU07mqkHYakiGp6dy09muk68T6j5mD0bvLNr3ajqcPrrR2/wxfBLXhvKlumfrJGdIlh+1aLOrMS1jmSE8/sEXtINt2rYTZ1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HSJwupS4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSJwupS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731867307; x=1763403307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Xr2UX8X1LoxjYuek3zWpQOeqFH0VjQ0KCIvb0cUJ74=;
  b=HSJwupS4oqsINQWPBTajs74FNk5Kos3DW9ThjAvkcqwjg173Hzkcw4QG
   zTvKFb9pcEW3SFElUl7BSyyhBP4eMFdWgFmDub+/POtWOC/f/9D6xgCqA
   bKg2Cp7YQXAU6CGEjRFqByD8TqcglIYv6eZVtygZX4x49kLLa1W2ioP09
   da+/fnm17+cK6u9Zpmhsa5MJCTmkt7EX4EoYQdzieI5ujbEeZ5fxsAKye
   jyyonkuupROCyBWmwjB7rrat6VhA4YAH5SBtonHtp7hJAA1ZRCRbIhzs4
   QAofvNkDkZq/XmPMfUJujtQXIqjp9wxkEq/aQi6cAcN85FvDrbckLk7/s
   g==;
X-CSE-ConnectionGUID: OvGgSvj5STaYV6mK6alGng==
X-CSE-MsgGUID: eAB/VGFZR+eSgr+tl0VchA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31918008"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="31918008"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 10:15:06 -0800
X-CSE-ConnectionGUID: GtXlZy7rSKqt8eGw0ZIkEA==
X-CSE-MsgGUID: i8cr+2g9Tdi/Bkf3neQ0tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="119967110"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Nov 2024 10:15:04 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCjna-0001zK-0B;
	Sun, 17 Nov 2024 18:15:02 +0000
Date: Mon, 18 Nov 2024 02:14:38 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 97/120]
 drivers/platform/x86/wmi-bmof.c:54:40: error: 'sysfs_bin_attr_read_simple'
 undeclared
Message-ID: <202411180223.rh4gF1xf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   216b83e0b4d86a2170ccde16f4a8117e32c02d85
commit: bffe6d88d03c33e4406bab7d0bd4873e91ccd03f [97/120] wmi-bmof
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241118/202411180223.rh4gF1xf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180223.rh4gF1xf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180223.rh4gF1xf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/wmi-bmof.c: In function 'wmi_bmof_probe':
>> drivers/platform/x86/wmi-bmof.c:54:40: error: 'sysfs_bin_attr_read_simple' undeclared (first use in this function)
      54 |         priv->bmof_bin_attr.read_new = sysfs_bin_attr_read_simple;
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/wmi-bmof.c:54:40: note: each undeclared identifier is reported only once for each function it appears in


vim +/sysfs_bin_attr_read_simple +54 drivers/platform/x86/wmi-bmof.c

    27	
    28	static int wmi_bmof_probe(struct wmi_device *wdev, const void *context)
    29	{
    30		struct bmof_priv *priv;
    31		int ret;
    32	
    33		priv = devm_kzalloc(&wdev->dev, sizeof(struct bmof_priv), GFP_KERNEL);
    34		if (!priv)
    35			return -ENOMEM;
    36	
    37		dev_set_drvdata(&wdev->dev, priv);
    38	
    39		priv->bmofdata = wmidev_block_query(wdev, 0);
    40		if (!priv->bmofdata) {
    41			dev_err(&wdev->dev, "failed to read Binary MOF\n");
    42			return -EIO;
    43		}
    44	
    45		if (priv->bmofdata->type != ACPI_TYPE_BUFFER) {
    46			dev_err(&wdev->dev, "Binary MOF is not a buffer\n");
    47			ret = -EIO;
    48			goto err_free;
    49		}
    50	
    51		sysfs_bin_attr_init(&priv->bmof_bin_attr);
    52		priv->bmof_bin_attr.attr.name = "bmof";
    53		priv->bmof_bin_attr.attr.mode = 0400;
  > 54		priv->bmof_bin_attr.read_new = sysfs_bin_attr_read_simple;
    55		priv->bmof_bin_attr.private = priv->bmofdata->buffer.pointer;
    56		priv->bmof_bin_attr.size = priv->bmofdata->buffer.length;
    57	
    58		ret = device_create_bin_file(&wdev->dev, &priv->bmof_bin_attr);
    59		if (ret)
    60			goto err_free;
    61	
    62		return 0;
    63	
    64	 err_free:
    65		kfree(priv->bmofdata);
    66		return ret;
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
