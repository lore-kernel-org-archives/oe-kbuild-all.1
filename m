Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0611D62171
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 19:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709581345; cv=none; b=aue1yTNv0n2fpYf05cPfSsDl6WsO5/hFfkkDKeVFwhmeXyQXOW79xuFmOJux6jvCNN1uihmBgcZJwWjoJ3+/QglyTAX+BFFyYa6Z69sOTZw/VP0n/wq78VjG3HhBi319ckeHCMrMJpUyYR0CqVV9HZREWbKU7qINL0MSbmVHKME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709581345; c=relaxed/simple;
	bh=E2F+INW1tqgs2teyJLc8ks8S7yocrv1UWQomIGYSzB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWFJNHa+hO8NLS2KFqxHRMtvzI2xHSHv3zn3rx4pDetWN99o9xOmPh/+tF/wHaOAj+ZLftFhpQbIqH9e+7Sx8UnO6aiAVYT9n8zzhKKl7dKQtmI3gCOB1g+BFagcLf2rPt/jiLdvjN7ZZS+XhX0p+jPyJROEooKbKn7CwqRggIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RIe3LHbq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RIe3LHbq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709581343; x=1741117343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E2F+INW1tqgs2teyJLc8ks8S7yocrv1UWQomIGYSzB4=;
  b=RIe3LHbqtC8S1or1VsT755FuoJXBYxnjZcBeWdRlPEPUQozviGL7CbjO
   /Pv3I9hOCCcl2aJA7Idu7Wm29AhMk8OM9Y65WkeiQPtWpgczaATt5nDWV
   BsEhfMEPdtTe5Xa1JjIm2sThZRhCe4sTzs0dn0XXO4NzlCDLvgzV5QPvW
   Ei8FkQBuimUcCoq8E7gSz2fPWlTbZv6OLdJayNBsD0NMDZ3/K2+335vj8
   vsIXCEsycBaz8eO9YVD5c8XUHVfuvwMWMvCSrG37XxL3e5/OACTk1YxET
   5OA0FWMuZyTW28PayYKgjozHt7q1NyehN7rPPoYIF6Bq6C35F3T6AhyVI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="3956393"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="3956393"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 11:42:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9172459"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2024 11:42:21 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhECY-0002j7-12;
	Mon, 04 Mar 2024 19:42:18 +0000
Date: Tue, 5 Mar 2024 03:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Zhao <haifeng.zhao@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v14 3/3] iommu/vt-d: improve ITE fault handling if target
 device isn't present
Message-ID: <202403050307.IC7JKfyl-lkp@intel.com>
References: <20240301080727.3529832-4-haifeng.zhao@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301080727.3529832-4-haifeng.zhao@linux.intel.com>

Hi Ethan,

kernel test robot noticed the following build errors:

[auto build test ERROR on e60bf5aa1a74c0652cd12d0cdc02f5c2b5fe5c74]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Zhao/PCI-make-pci_dev_is_disconnected-helper-public-for-other-drivers/20240301-161016
base:   e60bf5aa1a74c0652cd12d0cdc02f5c2b5fe5c74
patch link:    https://lore.kernel.org/r/20240301080727.3529832-4-haifeng.zhao%40linux.intel.com
patch subject: [PATCH v14 3/3] iommu/vt-d: improve ITE fault handling if target device isn't present
config: x86_64-randconfig-r052-20240304 (https://download.01.org/0day-ci/archive/20240305/202403050307.IC7JKfyl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050307.IC7JKfyl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050307.IC7JKfyl-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `qi_check_fault':
>> drivers/iommu/intel/dmar.c:1346: undefined reference to `device_rbtree_find'


vim +1346 drivers/iommu/intel/dmar.c

  1271	
  1272	static int qi_check_fault(struct intel_iommu *iommu, int index, int wait_index)
  1273	{
  1274		u32 fault;
  1275		int head, tail;
  1276		u64 iqe_err, ite_sid;
  1277		struct device *dev = NULL;
  1278		struct q_inval *qi = iommu->qi;
  1279		int shift = qi_shift(iommu);
  1280	
  1281		if (qi->desc_status[wait_index] == QI_ABORT)
  1282			return -EAGAIN;
  1283	
  1284		fault = readl(iommu->reg + DMAR_FSTS_REG);
  1285		if (fault & (DMA_FSTS_IQE | DMA_FSTS_ITE | DMA_FSTS_ICE))
  1286			qi_dump_fault(iommu, fault);
  1287	
  1288		/*
  1289		 * If IQE happens, the head points to the descriptor associated
  1290		 * with the error. No new descriptors are fetched until the IQE
  1291		 * is cleared.
  1292		 */
  1293		if (fault & DMA_FSTS_IQE) {
  1294			head = readl(iommu->reg + DMAR_IQH_REG);
  1295			if ((head >> shift) == index) {
  1296				struct qi_desc *desc = qi->desc + head;
  1297	
  1298				/*
  1299				 * desc->qw2 and desc->qw3 are either reserved or
  1300				 * used by software as private data. We won't print
  1301				 * out these two qw's for security consideration.
  1302				 */
  1303				memcpy(desc, qi->desc + (wait_index << shift),
  1304				       1 << shift);
  1305				writel(DMA_FSTS_IQE, iommu->reg + DMAR_FSTS_REG);
  1306				pr_info("Invalidation Queue Error (IQE) cleared\n");
  1307				return -EINVAL;
  1308			}
  1309		}
  1310	
  1311		/*
  1312		 * If ITE happens, all pending wait_desc commands are aborted.
  1313		 * No new descriptors are fetched until the ITE is cleared.
  1314		 */
  1315		if (fault & DMA_FSTS_ITE) {
  1316			head = readl(iommu->reg + DMAR_IQH_REG);
  1317			head = ((head >> shift) - 1 + QI_LENGTH) % QI_LENGTH;
  1318			head |= 1;
  1319			tail = readl(iommu->reg + DMAR_IQT_REG);
  1320			tail = ((tail >> shift) - 1 + QI_LENGTH) % QI_LENGTH;
  1321	
  1322			/*
  1323			 * SID field is valid only when the ITE field is Set in FSTS_REG
  1324			 * see Intel VT-d spec r4.1, section 11.4.9.9
  1325			 */
  1326			iqe_err = dmar_readq(iommu->reg + DMAR_IQER_REG);
  1327			ite_sid = DMAR_IQER_REG_ITESID(iqe_err);
  1328	
  1329			writel(DMA_FSTS_ITE, iommu->reg + DMAR_FSTS_REG);
  1330			pr_info("Invalidation Time-out Error (ITE) cleared\n");
  1331	
  1332			do {
  1333				if (qi->desc_status[head] == QI_IN_USE)
  1334					qi->desc_status[head] = QI_ABORT;
  1335				head = (head - 2 + QI_LENGTH) % QI_LENGTH;
  1336			} while (head != tail);
  1337	
  1338			/*
  1339			 * If device was released or isn't present, no need to retry
  1340			 * the ATS invalidate request anymore.
  1341			 *
  1342			 * 0 value of ite_sid means old VT-d device, no ite_sid value.
  1343			 * see Intel VT-d spec r4.1, section 11.4.9.9
  1344			 */
  1345			if (ite_sid) {
> 1346				dev = device_rbtree_find(iommu, ite_sid);
  1347				if (!dev || !dev_is_pci(dev) ||
  1348					!pci_device_is_present(to_pci_dev(dev)))
  1349					return -ETIMEDOUT;
  1350			}
  1351			if (qi->desc_status[wait_index] == QI_ABORT)
  1352				return -EAGAIN;
  1353		}
  1354	
  1355		if (fault & DMA_FSTS_ICE) {
  1356			writel(DMA_FSTS_ICE, iommu->reg + DMAR_FSTS_REG);
  1357			pr_info("Invalidation Completion Error (ICE) cleared\n");
  1358		}
  1359	
  1360		return 0;
  1361	}
  1362	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
