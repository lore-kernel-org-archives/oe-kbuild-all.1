Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B9519BA6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 04:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726289506; cv=none; b=HY6xLvWve8AgbQ8bfUZaAemEXBrBCuPiE83EWIlURtinOPN0d0FlcN+fbI+Tev7r//PUJw3MAu7RLbRtGb/geJladkK+Mmyi3NDjj9HYIhUidf1gp62fhMitW30EpMOqyXKfWPsyL1u6YHi4zHMgusjyzuSujQvCFetEWW5XbI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726289506; c=relaxed/simple;
	bh=E4c6QflteWgBIRLEVQEb9Q0PJW4TBM7fLV/SSCvKXLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gi3KWlWtHRbF5v2422xys9reEtHrJagBWRqNpg1ksSLPl8yts1kE2yFQ3Rb4dqITbKgTsPOPZ5dJOxovEaOiy38cyqhOLmFn7rlW4sirO0Ojz1fWJ8eTM1tbbaKQXEV1A9rTWaSPzgd+D7HRdctGa2UbSQDQYN7l2+EG7qxYPOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ga1f55sk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ga1f55sk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726289504; x=1757825504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E4c6QflteWgBIRLEVQEb9Q0PJW4TBM7fLV/SSCvKXLs=;
  b=ga1f55skkwHJsqhCLS9dv61HvKtXZP2riRM3rCil8Y9FvP+B/VqzAUiV
   sFx46ngfhgjrzPTb1xRE7zX1Y11StPdZ8CFHJDxlacbyVkXHpr49hJ3Qi
   Qctdgk/sgPgbfoUdrCI59rIJQt1Vs1jMHhlUz1EycCrlueFTFq6SeWqDe
   gjNZKb8IYeU9TjjGQGXGZZL2jRk090JeDxOm2nexS9Gr7srNcVakU700Y
   dVCVB3BcUGeg8UhuCNwO9Jh8xgNspvFDy2uD1uMM6ACwC5rTVi9Iq91zi
   wtLJfWXnYGUDljgQA9hp8PZEou0KsD9oVvsezF2Qw6+kT1eKYTd+bIsiJ
   Q==;
X-CSE-ConnectionGUID: WSogsyAnQuq3wdNN9KwwXg==
X-CSE-MsgGUID: r44OBULkSrW7qIDKcmX3yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25025905"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="25025905"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 21:51:41 -0700
X-CSE-ConnectionGUID: 1dgOnBUaRPOnHOA4EqW9ig==
X-CSE-MsgGUID: 9Qd47trRTIm4fLUgfDBI9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="73062337"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Sep 2024 21:51:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spKkz-0007NS-2s;
	Sat, 14 Sep 2024 04:51:37 +0000
Date: Sat, 14 Sep 2024 12:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wens:mtk-wip 31/45]
 drivers/platform/chrome/chromeos_of_hw_prober.c:102:16: error: cleanup
 argument not a function
Message-ID: <202409141246.fUmyj4Gl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   42c21929aeb3c7ca7b0ce9cacb1d0ff915d3c783
commit: 2356afb129312b111cc39b588356445f3b598c63 [31/45] platform/chrome: of_hw_prober: Support SKU ID based component selection
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240914/202409141246.fUmyj4Gl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141246.fUmyj4Gl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141246.fUmyj4Gl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/platform/chrome/chromeos_of_hw_prober.c: In function 'chromeos_sku_component_selector':
>> drivers/platform/chrome/chromeos_of_hw_prober.c:102:16: error: cleanup argument not a function
     102 |         struct of_changeset *ocs __free(kfree) = kzalloc(sizeof(*ocs), GFP_KERNEL);
         |                ^~~~~~~~~~~~
>> drivers/platform/chrome/chromeos_of_hw_prober.c:102:50: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
     102 |         struct of_changeset *ocs __free(kfree) = kzalloc(sizeof(*ocs), GFP_KERNEL);
         |                                                  ^~~~~~~
>> drivers/platform/chrome/chromeos_of_hw_prober.c:102:50: warning: initialization of 'struct of_changeset *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [m]:
   - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +102 drivers/platform/chrome/chromeos_of_hw_prober.c

    57	
    58	/*
    59	 * chromeos_sku_component_selector - Selectively enable a component based on SKU ID
    60	 *
    61	 * Based on the list of component options and SKU ID read back from the device
    62	 * tree, enable the matching component. Also update the OF graph if it exists,
    63	 * so that the enabled component's remote endpoint correctly points to it. This
    64	 * assumes a single local endpoint, which should be the case for panels and
    65	 * camera sensors.
    66	 */
    67	static int chromeos_sku_component_selector(struct device *dev, const void *data)
    68	{
    69		const struct chromeos_sku_component_data *pdata = data;
    70		const char *compatible;
    71		void *ptr __always_unused;
    72		int ret;
    73		u32 sku_id = 0;
    74	
    75		if (!data)
    76			return dev_err_probe(dev, -EINVAL, "No data given\n");
    77	
    78		ret = chromeos_get_coreboot_sku_id(dev, &sku_id);
    79		if (ret)
    80			return ret;
    81	
    82		compatible = NULL;
    83		for (unsigned int i = 0; i < pdata->num_options; i++)
    84			if ((sku_id & pdata->options[i].sku_id_mask) == pdata->options[i].sku_id_val) {
    85				compatible = pdata->options->compatible;
    86				break;
    87			}
    88	
    89		if (!compatible)
    90			return dev_err_probe(dev, -EINVAL, "Unknown SKU ID: 0x%x\n", sku_id);
    91	
    92		struct device_node *node __free(device_node) = of_find_compatible_node(NULL, NULL, compatible);
    93		if (!node)
    94			return dev_err_probe(dev, -ENODEV, "Cannot find matching device node\n");
    95	
    96		/* device node not marked as fail; don't mess with the device tree */
    97		if (!of_device_is_fail(node))
    98			return 0;
    99	
   100		dev_info(dev, "Enabling %pOF for SKU 0x%x\n", node, sku_id);
   101	
 > 102		struct of_changeset *ocs __free(kfree) = kzalloc(sizeof(*ocs), GFP_KERNEL);
   103		if (!ocs)
   104			return -ENOMEM;
   105	
   106		/* Create changeset to apply DT changes atomically */
   107		of_changeset_init(ocs);
   108	
   109		if (of_graph_is_present(node)) {
   110			ret = -EINVAL;
   111	
   112			/* This currently assumes a single port on the component. */
   113			struct device_node *endpoint __free(device_node) = of_graph_get_next_endpoint(node, NULL);
   114			if (!endpoint) {
   115				dev_err(dev, "No endpoint found for %pOF\n", node);
   116				goto err_destroy_ocs;
   117			}
   118	
   119			struct device_node *remote __free(device_node) = of_graph_get_remote_endpoint(endpoint);
   120			if (!remote) {
   121				dev_err(dev, "No remote endpoint node found for %pOF\n", endpoint);
   122				goto err_destroy_ocs;
   123			}
   124	
   125			ret = of_changeset_update_prop_u32(ocs, node, "remote-endpoint", endpoint->phandle);
   126			if (ret)
   127				goto err_destroy_ocs;
   128		}
   129	
   130		ret = of_changeset_update_prop_string(ocs, node, "status", "okay");
   131		if (ret)
   132			goto err_destroy_ocs;
   133		ret = of_changeset_apply(ocs);
   134		if (ret)
   135			goto err_destroy_ocs;
   136	
   137		/*
   138		 * ocs is intentionally kept around as it needs to
   139		 * exist as long as the change is applied.
   140		 */
   141		ptr = no_free_ptr(ocs);
   142	
   143		return 0;
   144	
   145	err_destroy_ocs:
   146		of_changeset_destroy(ocs);
   147		return ret;
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
