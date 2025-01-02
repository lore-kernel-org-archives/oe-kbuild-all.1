Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C79E19C558
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 09:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735810458; cv=none; b=iQcPBaPh5Tfi7W09TFceUAgReLqJbYy29cdOSN7NzyXEGPZR4dTFiHg1gDAX7dV1LKXRz9YOKFV6/eufCtyovAhmsKvDigv+tg82riF/u37CzF3ZXkifQTN2I/oJiv4e0K7cQmIpn7S01EC/uDucWl+A0u/EAcqEcwFN8a7UEDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735810458; c=relaxed/simple;
	bh=t8RxYDmJeinIWxQ3CfdK+WVjZGI/+Zg2YwN3eic2Nuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdRhoEsaxSd3FuqKnmKKAkqMwgfG9lJW/CW1qanWpTAZcNh4D7xIJMccqjoduEkal+i+oeublpx3BlX5IaVeNXYPiFo+2jJLbLOaN7bi0HMqqpNDYkeaAkQxGJWOaxGoHRiT9xqR7QsBYRkIoFgwHU+yNzhl6KNUqb+vDMmwBwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/raPM4J; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/raPM4J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735810456; x=1767346456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t8RxYDmJeinIWxQ3CfdK+WVjZGI/+Zg2YwN3eic2Nuk=;
  b=I/raPM4JJI6FBD8QvXXGKxV/iUL7Tb7DGB7cAgZXe8gkYYwRRthZwQ8s
   FEPyD/Lzh6xOxIDKI1OLt0GfX3zbekGevBNrps/5PdDlSnhRDu7cNh0qT
   xF6ro11fo58szovuUzB6xu/7M59GWCJGSUchxlqWImpCPZWchI972RJAF
   HREbFjRY+pqKef1iGXW7Elj3dmTIn1mh35zt/cfXjB6hHSy/lg75W4k2d
   DOZCCUMts02LT2M2sdy3sCXype5eXPhpuKydGoywrSsDs5d+bREd+t9Gp
   TzZvsDX1QEvZRb6gnTonOgTFN3ZpIZnvYEMzBWwzXrl+zybNqGvtWOZrA
   Q==;
X-CSE-ConnectionGUID: IOeZXlIMRMeTH+SxzKuaEg==
X-CSE-MsgGUID: LVqq2AfaS2SXjop+TMgVyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="61416307"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="61416307"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 01:34:16 -0800
X-CSE-ConnectionGUID: f7/ipxUcSzOHnoTiuZWaRQ==
X-CSE-MsgGUID: bHbakAgHTsC4nIraC+g1lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="101643602"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jan 2025 01:34:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTHak-0008MJ-1D;
	Thu, 02 Jan 2025 09:34:10 +0000
Date: Thu, 2 Jan 2025 17:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <superm1@kernel.org>,
	Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Cody T . -H . Chiu" <codyit@gmail.com>,
	John Martens <johnfanv2@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] platform/x86: Add Lenovo Other Mode WMI Driver
Message-ID: <202501021728.uZ2voPKr-lkp@intel.com>
References: <20250102004854.14874-5-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102004854.14874-5-derekjohn.clark@gmail.com>

Hi Derek,

kernel test robot noticed the following build errors:

[auto build test ERROR on amd-pstate/linux-next]
[also build test ERROR on amd-pstate/bleeding-edge linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Derek-J-Clark/platform-x86-Add-lenovo-wmi-drivers-Documentation/20250102-085149
base:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git linux-next
patch link:    https://lore.kernel.org/r/20250102004854.14874-5-derekjohn.clark%40gmail.com
patch subject: [PATCH v2 4/4] platform/x86: Add Lenovo Other Mode WMI Driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250102/202501021728.uZ2voPKr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501021728.uZ2voPKr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501021728.uZ2voPKr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/lenovo-wmi-other.c: In function 'other_method_fw_attr_add':
>> drivers/platform/x86/lenovo-wmi-other.c:288:64: error: implicit declaration of function 'MKDEV' [-Werror=implicit-function-declaration]
     288 |         priv->fw_attr_dev = device_create(fw_attr_class, NULL, MKDEV(0, 0),
         |                                                                ^~~~~
   cc1: some warnings being treated as errors


vim +/MKDEV +288 drivers/platform/x86/lenovo-wmi-other.c

   277	
   278	static int other_method_fw_attr_add(struct lenovo_wmi_om_priv *priv)
   279	{
   280		int err, i;
   281	
   282		err = fw_attributes_class_get(&fw_attr_class);
   283		if (err) {
   284			pr_err("Failed to get firmware_attributes_class: %u\n", err);
   285			return err;
   286		}
   287	
 > 288		priv->fw_attr_dev = device_create(fw_attr_class, NULL, MKDEV(0, 0),
   289						  NULL, "%s", FW_ATTR_FOLDER);
   290		if (IS_ERR(priv->fw_attr_dev)) {
   291			err = PTR_ERR(priv->fw_attr_dev);
   292			pr_err("Failed to create firmware_attributes_class device: %u\n",
   293			       err);
   294			goto fail_class_get;
   295		}
   296	
   297		priv->fw_attr_kset = kset_create_and_add("attributes", NULL,
   298							 &priv->fw_attr_dev->kobj);
   299		if (!priv->fw_attr_kset) {
   300			err = -ENOMEM;
   301			pr_err("Failed to create firmware_attributes_class kset: %u\n",
   302			       err);
   303			goto err_destroy_classdev;
   304		}
   305	
   306		for (i = 0; i < ARRAY_SIZE(capdata01_attr_groups) - 1; i++) {
   307			err = attr_capdata01_setup(
   308				capdata01_attr_groups[i].tunable_attr);
   309			if (err) {
   310				pr_err("Failed to populate capability data for %s: %u\n",
   311				       capdata01_attr_groups[i].attr_group->name, err);
   312				continue;
   313			}
   314	
   315			err = sysfs_create_group(&priv->fw_attr_kset->kobj,
   316						 capdata01_attr_groups[i].attr_group);
   317			if (err) {
   318				pr_err("Failed to create sysfs-group for %s: %u\n",
   319				       capdata01_attr_groups[i].attr_group->name, err);
   320				goto err_remove_groups;
   321			}
   322		}
   323	
   324		return 0;
   325	
   326	err_remove_groups:
   327		while (i-- > 0) {
   328			sysfs_remove_group(&priv->fw_attr_kset->kobj,
   329					   capdata01_attr_groups[i].attr_group);
   330		}
   331	
   332		return err;
   333	
   334	err_destroy_classdev:
   335		device_destroy(fw_attr_class, MKDEV(0, 0));
   336	
   337		return err;
   338	
   339	fail_class_get:
   340		fw_attributes_class_put();
   341	
   342		return err;
   343	}
   344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
