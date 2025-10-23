Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48CD30AD0E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761213550; cv=none; b=a4YT+p30cszY33fXno82IcrofCw4d7Y8l5yyDT7ml8TfdtoXA6KtaDy3BQap3cULx7g7wpsd2MCTTCqYBazHwh4zL+dl+OJJ64zQ8zRgyfdkdtZKjT5CZf0qr5ZCoWE85S2zbFPLAmcbj+QpmqINO3fN09KQUmh+qvk/pSxh+jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761213550; c=relaxed/simple;
	bh=/1vXsibgr0QCdKMz0q52WspRgykJNsKRvxsy7+LuE3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UN8USHdJhVtdwScUNDLodVwsygDVikn598y1znL3a1WUIHrTAMD/KguSLtBPzGPW/ZY3sfBoEuHz0KAiYvI64tpRYCTBTZDpDaikSVGYLE9ynPXsk/cUU4oR5ZdaOwHhkTQxs2wXuy/ikUjFJXe/Mk0Zu/+e2DRNdp+dkVbTDIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TT/vkFn2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TT/vkFn2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761213549; x=1792749549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/1vXsibgr0QCdKMz0q52WspRgykJNsKRvxsy7+LuE3Q=;
  b=TT/vkFn2ZWbVVW1bR2a5/gA6H7OYG3M7CYct11xS80yxUSMv9cM1MmU9
   nzXi4KSexQOT6H+2/Fd65QLrzIFcYqG7+nbN8V2WmVKrC2VSZ9BNyZDSK
   8kvVRxbenYmTnAXBM+oWGgtGfsWD5admTzzQiBmjmQFJU0hKhqcvkRc4v
   /qSzjvK9z8SsmXRCqOqEiEut050hOb1MBoSVqZnoYALtgDcT7rVENGFrn
   TdXvkcEEUxTwK+03CdISet8BBP2vq/CNL1hNeNTYIu1DhVSal3XFLCAik
   5rygDORiIlZNAxMh0CaHciYYRyWS6vhrTlxDM8C1taOF0rh4z9srOe9eY
   g==;
X-CSE-ConnectionGUID: 73ucFREoRxSFqjbllAvI8g==
X-CSE-MsgGUID: 7oOt0MXQS/+SRa2qk7T5ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74725080"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="74725080"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 02:59:05 -0700
X-CSE-ConnectionGUID: pe5qV8bDShWuRejZV4mvYw==
X-CSE-MsgGUID: 9f8M9NSnQFetHxslRmvHIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="221308724"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Oct 2025 02:59:02 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBs5s-000DKh-1R;
	Thu, 23 Oct 2025 09:58:55 +0000
Date: Thu, 23 Oct 2025 17:58:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: mtk_scp:  remove unnecessary checking
Message-ID: <202510231714.dlrsh9El-lkp@intel.com>
References: <aPi6eBlFLH43A4C0@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPi6eBlFLH43A4C0@stanley.mountain>

Hi Dan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on next-20251023]
[cannot apply to linus/master v6.18-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Carpenter/remoteproc-mtk_scp-remove-unnecessary-checking/20251022-200619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/aPi6eBlFLH43A4C0%40stanley.mountain
patch subject: [PATCH] remoteproc: mtk_scp:  remove unnecessary checking
config: arm-randconfig-003-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231714.dlrsh9El-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231714.dlrsh9El-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231714.dlrsh9El-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/remoteproc/mtk_scp.c: In function 'scp_rproc_init':
>> drivers/remoteproc/mtk_scp.c:1130:56: warning: '%1d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
      snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
                                                           ^~~
   drivers/remoteproc/mtk_scp.c:1130:50: note: directive argument in the range [0, 1073741824]
      snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
                                                     ^~~~~~~~~~
   drivers/remoteproc/mtk_scp.c:1130:3: note: 'snprintf' output between 7 and 16 bytes into a destination of size 7
      snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1130 drivers/remoteproc/mtk_scp.c

  1096	
  1097	/**
  1098	 * scp_get_default_fw_path() - Get default SCP firmware path
  1099	 * @dev:     SCP Device
  1100	 * @core_id: SCP Core number
  1101	 *
  1102	 * This function generates a path based on the following format:
  1103	 *     mediatek/(soc_model)/scp(_cX).img; for multi-core or
  1104	 *     mediatek/(soc_model)/scp.img for single core SCP HW
  1105	 *
  1106	 * Return: A devm allocated string containing the full path to
  1107	 *         a SCP firmware or an error pointer
  1108	 */
  1109	static const char *scp_get_default_fw_path(struct device *dev, int core_id)
  1110	{
  1111		struct device_node *np = core_id < 0 ? dev->of_node : dev->parent->of_node;
  1112		const char *compatible, *soc;
  1113		char scp_fw_file[7];
  1114		int ret;
  1115	
  1116		/* Use only the first compatible string */
  1117		ret = of_property_read_string_index(np, "compatible", 0, &compatible);
  1118		if (ret)
  1119			return ERR_PTR(ret);
  1120	
  1121		/* If the compatible string's length is implausible bail out early */
  1122		if (strlen(compatible) < strlen("mediatek,mtXXXX-scp"))
  1123			return ERR_PTR(-EINVAL);
  1124	
  1125		/* If the compatible string starts with "mediatek,mt" assume that it's ok */
  1126		if (!str_has_prefix(compatible, "mediatek,mt"))
  1127			return ERR_PTR(-EINVAL);
  1128	
  1129		if (core_id >= 0)
> 1130			snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
  1131		else
  1132			snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
  1133	
  1134		/* Not using strchr here, as strlen of a const gets optimized by compiler */
  1135		soc = &compatible[strlen("mediatek,")];
  1136	
  1137		return devm_kasprintf(dev, GFP_KERNEL, "mediatek/%.*s/%s.img",
  1138				      (int)strlen("mtXXXX"), soc, scp_fw_file);
  1139	}
  1140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
