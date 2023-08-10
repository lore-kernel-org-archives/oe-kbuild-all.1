Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42C5815
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 03:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691637840; x=1723173840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q/aHQvjoBML5mpcjjcoCEuW0NzepzjVrL08YwqJF+pU=;
  b=dz1e6CkR64Z+dewjYb33D7hNo+IOsfQ0itc1tiWP7FF97QLmL5Lpkgks
   m/zM4CvGkCX+Tqf2VYhjHdkwzfjH9nyb8eSf30+X2yakTKvw9hM5TAQU7
   gBgvib/OIDhSPSkoLh5XscveNc5mPpnHyTm9zjig10Ya60obEiT5fKcx3
   a/P/N5iqV+cv0hFp8mskjb7ZUvGaQpBB+IIfaP1LRickHkCPT8AzFCMsG
   Kp3rA63fnuz3x4c5r4TV1E0POt/Szv2qvWgJe2hDaR2KD0FNiTFdPbGWb
   0AvmvhtLghMJe69uRdm73jl1Lm6qkzPCvrx4J3M+FarQSfDP2cYujaDuS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="350867805"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="350867805"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 20:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="1062727732"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="1062727732"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Aug 2023 20:23:58 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTwHF-0006h8-0n;
	Thu, 10 Aug 2023 03:23:57 +0000
Date: Thu, 10 Aug 2023 11:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting_08092023-yi 50/63]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2932:35: error: initialization
 of 'int (*)(struct device *, const union iommu_set_dev_data_user_data *)'
 from incompatible pointer type 'int (*)(struct device *, const union
 iommu_set_dev_user_data *)'
Message-ID: <202308101139.8QEgcXQA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting_08092023-yi
head:   deac4d727b4f1a29d87ddb50c141530c3f07003a
commit: 35f6e4c9f90f34f3fdbbbc012fde4ab018610cc9 [50/63] iommu/arm-smmu-v3: Add arm_smmu_set/unset_dev_user_data
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230810/202308101139.8QEgcXQA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101139.8QEgcXQA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101139.8QEgcXQA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2764:45: warning: 'union iommu_set_dev_user_data' declared inside parameter list will not be visible outside of this definition or declaration
    2764 |                                 const union iommu_set_dev_user_data *user_data)
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2932:35: error: initialization of 'int (*)(struct device *, const union iommu_set_dev_data_user_data *)' from incompatible pointer type 'int (*)(struct device *, const union iommu_set_dev_user_data *)' [-Werror=incompatible-pointer-types]
    2932 |         .set_dev_user_data      = arm_smmu_set_dev_user_data,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2932:35: note: (near initialization for 'arm_smmu_ops.set_dev_user_data')
   cc1: some warnings being treated as errors


vim +2932 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  2762	
  2763	static int arm_smmu_set_dev_user_data(struct device *dev,
> 2764					const union iommu_set_dev_user_data *user_data)
  2765	{
  2766		const struct iommu_dev_data_arm_smmuv3 *user =
  2767			(const struct iommu_dev_data_arm_smmuv3 *)user_data;
  2768		struct arm_smmu_master *master = dev_iommu_priv_get(dev);
  2769		struct arm_smmu_stream *stream = &master->streams[0];
  2770		struct arm_smmu_device *smmu = master->smmu;
  2771		u32 sid_user = user->sid;
  2772		int ret = 0;
  2773	
  2774		if (!sid_user)
  2775			return -EINVAL;
  2776	
  2777		ret = xa_alloc(&smmu->streams_user, &sid_user, stream,
  2778			       XA_LIMIT(sid_user, sid_user), GFP_KERNEL_ACCOUNT);
  2779		if (ret)
  2780			return ret;
  2781		stream->id_user = sid_user;
  2782		return 0;
  2783	}
  2784	
  2785	static void arm_smmu_unset_dev_user_data(struct device *dev)
  2786	{
  2787		struct arm_smmu_master *master = dev_iommu_priv_get(dev);
  2788		struct arm_smmu_stream *stream = &master->streams[0];
  2789		struct arm_smmu_device *smmu = master->smmu;
  2790		u32 sid_user = stream->id_user;
  2791	
  2792		if (!sid_user)
  2793			return;
  2794	
  2795		xa_lock(&smmu->streams_user);
  2796		stream = __xa_erase(&smmu->streams_user, sid_user);
  2797		if (stream != master->streams) {
  2798			WARN_ON(__xa_alloc(&smmu->streams_user, &sid_user, stream,
  2799					   XA_LIMIT(sid_user, sid_user),
  2800					   GFP_KERNEL_ACCOUNT));
  2801		}
  2802		xa_unlock(&smmu->streams_user);
  2803	}
  2804	
  2805	static struct iommu_group *arm_smmu_device_group(struct device *dev)
  2806	{
  2807		struct iommu_group *group;
  2808	
  2809		/*
  2810		 * We don't support devices sharing stream IDs other than PCI RID
  2811		 * aliases, since the necessary ID-to-device lookup becomes rather
  2812		 * impractical given a potential sparse 32-bit stream ID space.
  2813		 */
  2814		if (dev_is_pci(dev))
  2815			group = pci_device_group(dev);
  2816		else
  2817			group = generic_device_group(dev);
  2818	
  2819		return group;
  2820	}
  2821	
  2822	static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args *args)
  2823	{
  2824		return iommu_fwspec_add_ids(dev, args->args, 1);
  2825	}
  2826	
  2827	static void arm_smmu_get_resv_regions(struct device *dev,
  2828					      struct list_head *head)
  2829	{
  2830		struct iommu_resv_region *region;
  2831		int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
  2832	
  2833		region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
  2834						 prot, IOMMU_RESV_SW_MSI, GFP_KERNEL);
  2835		if (!region)
  2836			return;
  2837	
  2838		list_add_tail(&region->list, head);
  2839	
  2840		iommu_dma_get_resv_regions(dev, head);
  2841	}
  2842	
  2843	static int arm_smmu_dev_enable_feature(struct device *dev,
  2844					       enum iommu_dev_features feat)
  2845	{
  2846		struct arm_smmu_master *master = dev_iommu_priv_get(dev);
  2847	
  2848		if (!master)
  2849			return -ENODEV;
  2850	
  2851		switch (feat) {
  2852		case IOMMU_DEV_FEAT_IOPF:
  2853			if (!arm_smmu_master_iopf_supported(master))
  2854				return -EINVAL;
  2855			if (master->iopf_enabled)
  2856				return -EBUSY;
  2857			master->iopf_enabled = true;
  2858			return 0;
  2859		case IOMMU_DEV_FEAT_SVA:
  2860			if (!arm_smmu_master_sva_supported(master))
  2861				return -EINVAL;
  2862			if (arm_smmu_master_sva_enabled(master))
  2863				return -EBUSY;
  2864			return arm_smmu_master_enable_sva(master);
  2865		default:
  2866			return -EINVAL;
  2867		}
  2868	}
  2869	
  2870	static int arm_smmu_dev_disable_feature(struct device *dev,
  2871						enum iommu_dev_features feat)
  2872	{
  2873		struct arm_smmu_master *master = dev_iommu_priv_get(dev);
  2874	
  2875		if (!master)
  2876			return -EINVAL;
  2877	
  2878		switch (feat) {
  2879		case IOMMU_DEV_FEAT_IOPF:
  2880			if (!master->iopf_enabled)
  2881				return -EINVAL;
  2882			if (master->sva_enabled)
  2883				return -EBUSY;
  2884			master->iopf_enabled = false;
  2885			return 0;
  2886		case IOMMU_DEV_FEAT_SVA:
  2887			if (!arm_smmu_master_sva_enabled(master))
  2888				return -EINVAL;
  2889			return arm_smmu_master_disable_sva(master);
  2890		default:
  2891			return -EINVAL;
  2892		}
  2893	}
  2894	
  2895	/*
  2896	 * HiSilicon PCIe tune and trace device can be used to trace TLP headers on the
  2897	 * PCIe link and save the data to memory by DMA. The hardware is restricted to
  2898	 * use identity mapping only.
  2899	 */
  2900	#define IS_HISI_PTT_DEVICE(pdev)	((pdev)->vendor == PCI_VENDOR_ID_HUAWEI && \
  2901						 (pdev)->device == 0xa12e)
  2902	
  2903	static int arm_smmu_def_domain_type(struct device *dev)
  2904	{
  2905		if (dev_is_pci(dev)) {
  2906			struct pci_dev *pdev = to_pci_dev(dev);
  2907	
  2908			if (IS_HISI_PTT_DEVICE(pdev))
  2909				return IOMMU_DOMAIN_IDENTITY;
  2910		}
  2911	
  2912		return 0;
  2913	}
  2914	
  2915	static void arm_smmu_remove_dev_pasid(struct device *dev, ioasid_t pasid)
  2916	{
  2917		struct iommu_domain *domain;
  2918	
  2919		domain = iommu_get_domain_for_dev_pasid(dev, pasid, IOMMU_DOMAIN_SVA);
  2920		if (WARN_ON(IS_ERR(domain)) || !domain)
  2921			return;
  2922	
  2923		arm_smmu_sva_remove_dev_pasid(domain, dev, pasid);
  2924	}
  2925	
  2926	static struct iommu_ops arm_smmu_ops = {
  2927		.capable		= arm_smmu_capable,
  2928		.hw_info		= arm_smmu_hw_info,
  2929		.domain_alloc		= arm_smmu_domain_alloc,
  2930		.probe_device		= arm_smmu_probe_device,
  2931		.release_device		= arm_smmu_release_device,
> 2932		.set_dev_user_data	= arm_smmu_set_dev_user_data,
  2933		.unset_dev_user_data	= arm_smmu_unset_dev_user_data,
  2934		.dev_user_data_len	=
  2935			IOMMU_USER_DATA_LENGTH(struct iommu_dev_data_arm_smmuv3, sid),
  2936		.device_group		= arm_smmu_device_group,
  2937		.of_xlate		= arm_smmu_of_xlate,
  2938		.get_resv_regions	= arm_smmu_get_resv_regions,
  2939		.remove_dev_pasid	= arm_smmu_remove_dev_pasid,
  2940		.dev_enable_feat	= arm_smmu_dev_enable_feature,
  2941		.dev_disable_feat	= arm_smmu_dev_disable_feature,
  2942		.page_response		= arm_smmu_page_response,
  2943		.def_domain_type	= arm_smmu_def_domain_type,
  2944		.pgsize_bitmap		= -1UL, /* Restricted during device attach */
  2945		.owner			= THIS_MODULE,
  2946		.default_domain_ops = &(const struct iommu_domain_ops) {
  2947			.attach_dev		= arm_smmu_attach_dev,
  2948			.map_pages		= arm_smmu_map_pages,
  2949			.unmap_pages		= arm_smmu_unmap_pages,
  2950			.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
  2951			.iotlb_sync		= arm_smmu_iotlb_sync,
  2952			.iova_to_phys		= arm_smmu_iova_to_phys,
  2953			.free			= arm_smmu_domain_free,
  2954		}
  2955	};
  2956	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
