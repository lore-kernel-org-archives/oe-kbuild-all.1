Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B722206E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Mar 2024 14:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710859484; cv=none; b=oivrnX6E+KbVBdDinkTuZj+WqJgZPBsVQQxY3BF16sp6aVMhe8S8siKmVS/bVGFT1QQUtexD8huAH4il9zb7TlbGyKG332wcANW6e96/MfgmSMB6LthhtpJceAqUKUNloKFmkSpV6ykXmXsiFddp/eo7/0LJZXDVt67HjKLf/2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710859484; c=relaxed/simple;
	bh=kYjsIITzMQl3DxuQiHcSI937QsGTvoK0AKyF4UJZ4n0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SIDuczI8ixHR8FekGRkEn23PMDaXJV8vjJ/FWOJ8m0DCcqZYAwlz46hQjeFw2ELkCtrI5LlrO1X4rTnEeBEi4405WX+85CZFRIw/XH4j8urd66ify/Omxy2S/6zWiMO4n6Mg70Uln1K5s2LT2+TZkIPKxFMLPGH9pxnqtOLNgf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ms+F0/i8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ms+F0/i8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710859480; x=1742395480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kYjsIITzMQl3DxuQiHcSI937QsGTvoK0AKyF4UJZ4n0=;
  b=ms+F0/i86caJt6wBW3voqU0jqF94EURgAuVUoRCosmOnnaAfMd9NDIMw
   4JjK5L7G0t66yZ6u6z0aB8S8rnbIuvPawFqx/oWNv7UuWDJzsZOL4tX3X
   S+sCzXVTPTF5QjGn913Fk+aQUrdb5zwX2vRnbmVbps0DsCSxdpT8mfTQ8
   lZNn619Yu0GnSbZnL0AS5E4+dVNe23aFSRmrHF4AjdxZoV+Kb4k04o0v6
   t/fypTKP5Ln12nNTRGNDK6s49FKAR4uh3zkmSyv5D19dktwAPYJSWfm6B
   CSDyjGhy+Ac62Q8ZhbVTmw2UXtX/jPliu3XxzsjIa83MUWdmSbZYjdmf2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5590871"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="5590871"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 07:44:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="18407400"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Mar 2024 07:44:38 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmahf-000HpX-2m;
	Tue, 19 Mar 2024 14:44:35 +0000
Date: Tue, 19 Mar 2024 22:43:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, tianx <tianx@yunsilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 28734/30000]
 drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h:1752:32: warning:
 bitwise or with non-zero value always evaluates to true
Message-ID: <202403192226.xeD34VaP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   efcbd7d2c09d823eef22dff4bce44d8712ca50c4
commit: 23b8024ef459f8b615c223df6175ea17c6b50c48 [28734/30000] drivers: update yunsilicon drivers to version 1.1.0.375
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240319/202403192226.xeD34VaP-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403192226.xeD34VaP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403192226.xeD34VaP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/infiniband/hw/xsc/main.c:15:
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h:1752:32: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
    1752 |         if (dev->caps.hw_feature_flag | XSC_HW_RDMA_SUPPORT)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/xsc/main.c:41:6: warning: no previous prototype for function 'xsc_get_sys_image_guid' [-Wmissing-prototypes]
      41 | void xsc_get_sys_image_guid(u8 *dev_addr, u8 *guid)
         |      ^
   drivers/infiniband/hw/xsc/main.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | void xsc_get_sys_image_guid(u8 *dev_addr, u8 *guid)
         | ^
         | static 
   drivers/infiniband/hw/xsc/main.c:68:6: warning: variable 'max_sq_sg' set but not used [-Wunused-but-set-variable]
      68 |         int max_sq_sg;
         |             ^
   drivers/infiniband/hw/xsc/main.c:307:5: warning: no previous prototype for function 'xsc_ib_add_gid' [-Wmissing-prototypes]
     307 | int xsc_ib_add_gid(const struct ib_gid_attr *attr, void **context)
         |     ^
   drivers/infiniband/hw/xsc/main.c:307:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     307 | int xsc_ib_add_gid(const struct ib_gid_attr *attr, void **context)
         | ^
         | static 
   drivers/infiniband/hw/xsc/main.c:573:6: warning: no previous prototype for function 'xsc_get_guid' [-Wmissing-prototypes]
     573 | void xsc_get_guid(u8 *dev_addr, u8 *guid)
         |      ^
   drivers/infiniband/hw/xsc/main.c:573:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     573 | void xsc_get_guid(u8 *dev_addr, u8 *guid)
         | ^
         | static 
   drivers/infiniband/hw/xsc/main.c:602:6: warning: no previous prototype for function 'xsc_core_event' [-Wmissing-prototypes]
     602 | void xsc_core_event(struct xsc_core_device *xdev, enum xsc_dev_event event,
         |      ^
   drivers/infiniband/hw/xsc/main.c:602:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     602 | void xsc_core_event(struct xsc_core_device *xdev, enum xsc_dev_event event,
         | ^
         | static 
   drivers/infiniband/hw/xsc/main.c:773:30: warning: implicit conversion from enumeration type 'enum xsc_rdma_driver_id' to different enumeration type 'enum rdma_driver_id' [-Wenum-conversion]
     773 |         dev->ib_dev.ops.driver_id = RDMA_DRIVER_XSC5;
         |                                   ~ ^~~~~~~~~~~~~~~~
   7 warnings generated.
--
   In file included from drivers/infiniband/hw/xsc/xsc_rdma_ctrl.c:11:
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h:1752:32: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
    1752 |         if (dev->caps.hw_feature_flag | XSC_HW_RDMA_SUPPORT)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/xsc/xsc_rdma_ctrl.c:408:5: warning: no previous prototype for function '_rdma_ctrl_exec_ioctl' [-Wmissing-prototypes]
     408 | int _rdma_ctrl_exec_ioctl(struct xsc_core_device *xdev, void *in, int in_size, void *out,
         |     ^
   drivers/infiniband/hw/xsc/xsc_rdma_ctrl.c:408:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     408 | int _rdma_ctrl_exec_ioctl(struct xsc_core_device *xdev, void *in, int in_size, void *out,
         | ^
         | static 
   drivers/infiniband/hw/xsc/xsc_rdma_ctrl.c:672:6: warning: no previous prototype for function 'xsc_rdma_ctrl_fini' [-Wmissing-prototypes]
     672 | void xsc_rdma_ctrl_fini(void)
         |      ^
   drivers/infiniband/hw/xsc/xsc_rdma_ctrl.c:672:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     672 | void xsc_rdma_ctrl_fini(void)
         | ^
         | static 
   drivers/infiniband/hw/xsc/xsc_rdma_ctrl.c:677:5: warning: no previous prototype for function 'xsc_rdma_ctrl_init' [-Wmissing-prototypes]
     677 | int xsc_rdma_ctrl_init(void)
         |     ^
   drivers/infiniband/hw/xsc/xsc_rdma_ctrl.c:677:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     677 | int xsc_rdma_ctrl_init(void)
         | ^
         | static 
   4 warnings generated.
--
   In file included from drivers/infiniband/hw/xsc/cq.c:9:
   In file included from drivers/infiniband/hw/xsc/xsc_ib.h:15:
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h:1752:32: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
    1752 |         if (dev->caps.hw_feature_flag | XSC_HW_RDMA_SUPPORT)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/xsc/cq.c:361:5: warning: no previous prototype for function 'xsc_cqe_is_empty' [-Wmissing-prototypes]
     361 | int xsc_cqe_is_empty(struct xsc_ib_cq *cq)
         |     ^
   drivers/infiniband/hw/xsc/cq.c:361:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     361 | int xsc_cqe_is_empty(struct xsc_ib_cq *cq)
         | ^
         | static 
   2 warnings generated.
--
   In file included from drivers/infiniband/hw/xsc/qp.c:9:
   In file included from drivers/infiniband/hw/xsc/xsc_ib.h:15:
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h:1752:32: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
    1752 |         if (dev->caps.hw_feature_flag | XSC_HW_RDMA_SUPPORT)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/xsc/qp.c:264:26: warning: variable 'context' set but not used [-Wunused-but-set-variable]
     264 |         struct xsc_ib_ucontext *context;
         |                                 ^
   drivers/infiniband/hw/xsc/qp.c:346:26: warning: variable 'context' set but not used [-Wunused-but-set-variable]
     346 |         struct xsc_ib_ucontext *context;
         |                                 ^
   drivers/infiniband/hw/xsc/qp.c:1208:5: warning: no previous prototype for function 'xsc_icrc_hdr' [-Wmissing-prototypes]
    1208 | u32 xsc_icrc_hdr(struct xsc_ib_dev *dev, void *pkt, u32 size, u32 *icrc)
         |     ^
   drivers/infiniband/hw/xsc/qp.c:1208:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1208 | u32 xsc_icrc_hdr(struct xsc_ib_dev *dev, void *pkt, u32 size, u32 *icrc)
         | ^
         | static 
   drivers/infiniband/hw/xsc/qp.c:1298:5: warning: no previous prototype for function 'build_qp1_send_v2' [-Wmissing-prototypes]
    1298 | int build_qp1_send_v2(struct xsc_ib_dev *dev,
         |     ^
   drivers/infiniband/hw/xsc/qp.c:1298:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1298 | int build_qp1_send_v2(struct xsc_ib_dev *dev,
         | ^
         | static 
   drivers/infiniband/hw/xsc/qp.c:1786:33: warning: unused function 'to_ib_mig_state' [-Wunused-function]
    1786 | static inline enum ib_mig_state to_ib_mig_state(int xsc_mig_state)
         |                                 ^~~~~~~~~~~~~~~
   6 warnings generated.
--
   In file included from drivers/infiniband/hw/xsc/mem.c:9:
   In file included from drivers/infiniband/hw/xsc/xsc_ib.h:15:
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h:1752:32: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
    1752 |         if (dev->caps.hw_feature_flag | XSC_HW_RDMA_SUPPORT)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/hw/xsc/mem.c:21:5: warning: no previous prototype for function 'xsc_find_chunk_cont_0' [-Wmissing-prototypes]
      21 | int xsc_find_chunk_cont_0(struct xsc_pa_chunk *chunk,
         |     ^
   drivers/infiniband/hw/xsc/mem.c:21:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      21 | int xsc_find_chunk_cont_0(struct xsc_pa_chunk *chunk,
         | ^
         | static 
   drivers/infiniband/hw/xsc/mem.c:193:6: warning: no previous prototype for function '__xsc_ib_cont_pages' [-Wmissing-prototypes]
     193 | void __xsc_ib_cont_pages(struct ib_umem *umem, u64 addr,
         |      ^
   drivers/infiniband/hw/xsc/mem.c:193:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     193 | void __xsc_ib_cont_pages(struct ib_umem *umem, u64 addr,
         | ^
         | static 
   drivers/infiniband/hw/xsc/mem.c:259:6: warning: no previous prototype for function '__xsc_ib_populate_pas' [-Wmissing-prototypes]
     259 | void __xsc_ib_populate_pas(struct xsc_ib_dev *dev, struct ib_umem *umem,
         |      ^
   drivers/infiniband/hw/xsc/mem.c:259:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     259 | void __xsc_ib_populate_pas(struct xsc_ib_dev *dev, struct ib_umem *umem,
         | ^
         | static 
   4 warnings generated.
--
   In file included from drivers/infiniband/hw/xsc/mr.c:15:
   In file included from drivers/infiniband/hw/xsc/xsc_ib.h:15:
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h:1752:32: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
    1752 |         if (dev->caps.hw_feature_flag | XSC_HW_RDMA_SUPPORT)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/xsc/mr.c:75:6: warning: no previous prototype for function 'xsc_fill_pas' [-Wmissing-prototypes]
      75 | void xsc_fill_pas(int npages, u64 *pas, __be64 *req_pas)
         |      ^
   drivers/infiniband/hw/xsc/mr.c:75:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      75 | void xsc_fill_pas(int npages, u64 *pas, __be64 *req_pas)
         | ^
         | static 
>> drivers/infiniband/hw/xsc/mr.c:160:6: warning: variable 'using_peer_mem' set but not used [-Wunused-but-set-variable]
     160 |         int using_peer_mem = 0;
         |             ^
   3 warnings generated.
--
   In file included from drivers/infiniband/hw/xsc/ah.c:12:
   In file included from drivers/infiniband/hw/xsc/xsc_ib.h:15:
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h:1752:32: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
    1752 |         if (dev->caps.hw_feature_flag | XSC_HW_RDMA_SUPPORT)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
--
   In file included from drivers/infiniband/hw/xsc/devx.c:11:
   In file included from drivers/net/ethernet/yunsilicon/xsc/common/driver.h:18:
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h:1752:32: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
    1752 |         if (dev->caps.hw_feature_flag | XSC_HW_RDMA_SUPPORT)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/xsc/devx.c:75:1: warning: unused variable 'xsc_ib_object_XSC_IB_OBJECT_DEVX' [-Wunused-const-variable]
      75 | DECLARE_UVERBS_GLOBAL_METHODS(XSC_IB_OBJECT_DEVX,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      76 |                               &UVERBS_METHOD(XSC_IB_METHOD_DEVX_OTHER));
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:67:40: note: expanded from macro 'DECLARE_UVERBS_GLOBAL_METHODS'
      67 |         static const struct uverbs_object_def UVERBS_OBJECT(_object_id) = {    \
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:19:27: note: expanded from macro 'UVERBS_OBJECT'
      19 | #define UVERBS_OBJECT(id)       _UVERBS_NAME(UVERBS_MODULE_NAME, _object_##id)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:16:28: note: expanded from macro '_UVERBS_NAME'
      16 | #define _UVERBS_NAME(x, y)      _UVERBS_PASTE(x, y)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:15:29: note: expanded from macro '_UVERBS_PASTE'
      15 | #define _UVERBS_PASTE(x, y)     x ## y
         |                                 ^~~~~~
   <scratch space>:118:1: note: expanded from here
     118 | xsc_ib_object_XSC_IB_OBJECT_DEVX
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from drivers/infiniband/hw/xsc/private_dev.c:11:
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h:1752:32: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
    1752 |         if (dev->caps.hw_feature_flag | XSC_HW_RDMA_SUPPORT)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/xsc/private_dev.c:429:5: warning: no previous prototype for function 'xsc_priv_dev_exec_ioctl' [-Wmissing-prototypes]
     429 | int xsc_priv_dev_exec_ioctl(struct xsc_core_device *xdev, void *in, int in_size, void *out,
         |     ^
   drivers/infiniband/hw/xsc/private_dev.c:429:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     429 | int xsc_priv_dev_exec_ioctl(struct xsc_core_device *xdev, void *in, int in_size, void *out,
         | ^
         | static 
   2 warnings generated.
--
   In file included from drivers/net/ethernet/yunsilicon/xsc/net/main.c:21:
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h:1752:32: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
    1752 |         if (dev->caps.hw_feature_flag | XSC_HW_RDMA_SUPPORT)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/yunsilicon/xsc/net/main.c:29:
   In file included from drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_txrx.h:11:
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_debug.h:68:7: warning: variable 'pos' set but not used [-Wunused-but-set-variable]
      68 |                 int pos;
         |                     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:166:5: warning: no previous prototype for function 'xsc_rx_alloc_page_cache' [-Wmissing-prototypes]
     166 | int xsc_rx_alloc_page_cache(struct xsc_rq *rq, int node, u8 log_init_sz)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:166:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     166 | int xsc_rx_alloc_page_cache(struct xsc_rq *rq, int node, u8 log_init_sz)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:179:6: warning: no previous prototype for function 'xsc_rx_free_page_cache' [-Wmissing-prototypes]
     179 | void xsc_rx_free_page_cache(struct xsc_rq *rq)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:179:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     179 | void xsc_rx_free_page_cache(struct xsc_rq *rq)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:197:6: warning: no previous prototype for function 'xsc_eth_cq_error_event' [-Wmissing-prototypes]
     197 | void xsc_eth_cq_error_event(struct xsc_core_cq *xcq, enum xsc_event event)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:197:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     197 | void xsc_eth_cq_error_event(struct xsc_core_cq *xcq, enum xsc_event event)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:211:6: warning: no previous prototype for function 'xsc_eth_completion_event' [-Wmissing-prototypes]
     211 | void xsc_eth_completion_event(struct xsc_core_cq *xcq)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:211:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     211 | void xsc_eth_completion_event(struct xsc_core_cq *xcq)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:260:5: warning: no previous prototype for function 'xsc_eth_create_cq' [-Wmissing-prototypes]
     260 | int xsc_eth_create_cq(struct xsc_core_device *xdev, struct xsc_core_cq *xcq,
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:260:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     260 | int xsc_eth_create_cq(struct xsc_core_device *xdev, struct xsc_core_cq *xcq,
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:295:5: warning: no previous prototype for function 'xsc_eth_destroy_cq' [-Wmissing-prototypes]
     295 | int xsc_eth_destroy_cq(struct xsc_core_device *xdev, struct xsc_cq *cq)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:295:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     295 | int xsc_eth_destroy_cq(struct xsc_core_device *xdev, struct xsc_cq *cq)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:333:6: warning: no previous prototype for function 'xsc_eth_free_cq' [-Wmissing-prototypes]
     333 | void xsc_eth_free_cq(struct xsc_cq *cq)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:333:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     333 | void xsc_eth_free_cq(struct xsc_cq *cq)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:338:5: warning: no previous prototype for function 'xsc_eth_create_rss_qp_rqs' [-Wmissing-prototypes]
     338 | int xsc_eth_create_rss_qp_rqs(struct xsc_core_device *xdev,
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:338:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     338 | int xsc_eth_create_rss_qp_rqs(struct xsc_core_device *xdev,
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:359:6: warning: no previous prototype for function 'xsc_eth_qp_event' [-Wmissing-prototypes]
     359 | void xsc_eth_qp_event(struct xsc_core_qp *qp, int type)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:359:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     359 | void xsc_eth_qp_event(struct xsc_core_qp *qp, int type)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:389:5: warning: no previous prototype for function 'xsc_eth_create_qp_rq' [-Wmissing-prototypes]
     389 | int xsc_eth_create_qp_rq(struct xsc_core_device *xdev, struct xsc_rq *prq,
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:389:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     389 | int xsc_eth_create_qp_rq(struct xsc_core_device *xdev, struct xsc_rq *prq,
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:416:5: warning: no previous prototype for function 'xsc_eth_destroy_qp_rq' [-Wmissing-prototypes]
     416 | int xsc_eth_destroy_qp_rq(struct xsc_core_device *xdev, struct xsc_rq *prq)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:416:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     416 | int xsc_eth_destroy_qp_rq(struct xsc_core_device *xdev, struct xsc_rq *prq)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:469:5: warning: no previous prototype for function 'xsc_eth_create_qp_sq' [-Wmissing-prototypes]
     469 | int xsc_eth_create_qp_sq(struct xsc_core_device *xdev, struct xsc_sq *psq,
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:469:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     469 | int xsc_eth_create_qp_sq(struct xsc_core_device *xdev, struct xsc_sq *psq,
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:488:5: warning: no previous prototype for function 'xsc_eth_modify_qp_sq' [-Wmissing-prototypes]
     488 | int xsc_eth_modify_qp_sq(struct xsc_core_device *xdev, struct xsc_modify_raw_qp_mbox_in *in)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:488:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     488 | int xsc_eth_modify_qp_sq(struct xsc_core_device *xdev, struct xsc_modify_raw_qp_mbox_in *in)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:506:5: warning: no previous prototype for function 'xsc_eth_destroy_qp_sq' [-Wmissing-prototypes]
     506 | int xsc_eth_destroy_qp_sq(struct xsc_core_device *xdev, struct xsc_sq *psq)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:506:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     506 | int xsc_eth_destroy_qp_sq(struct xsc_core_device *xdev, struct xsc_sq *psq)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:750:5: warning: no previous prototype for function 'xsc_eth_set_hw_mtu' [-Wmissing-prototypes]
     750 | int xsc_eth_set_hw_mtu(struct xsc_core_device *dev, u16 mtu, u16 rx_buf_sz)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:750:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     750 | int xsc_eth_set_hw_mtu(struct xsc_core_device *dev, u16 mtu, u16 rx_buf_sz)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:775:5: warning: no previous prototype for function 'xsc_eth_get_mac' [-Wmissing-prototypes]
     775 | int xsc_eth_get_mac(struct xsc_core_device *dev, char *mac)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:775:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     775 | int xsc_eth_get_mac(struct xsc_core_device *dev, char *mac)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:806:5: warning: no previous prototype for function 'xsc_eth_modify_qps_channel' [-Wmissing-prototypes]
     806 | int xsc_eth_modify_qps_channel(struct xsc_adapter *adapter, struct xsc_channel *c)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:806:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     806 | int xsc_eth_modify_qps_channel(struct xsc_adapter *adapter, struct xsc_channel *c)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:828:5: warning: no previous prototype for function 'xsc_eth_modify_qps' [-Wmissing-prototypes]
     828 | int xsc_eth_modify_qps(struct xsc_adapter *adapter,
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:828:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     828 | int xsc_eth_modify_qps(struct xsc_adapter *adapter,
         | ^
         | static 
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:845:5: warning: no previous prototype for function 'xsc_rx_get_linear_frag_sz' [-Wmissing-prototypes]
     845 | u32 xsc_rx_get_linear_frag_sz(u32 mtu)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:845:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     845 | u32 xsc_rx_get_linear_frag_sz(u32 mtu)
         | ^
         | static 
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:852:6: warning: no previous prototype for function 'xsc_rx_is_linear_skb' [-Wmissing-prototypes]
     852 | bool xsc_rx_is_linear_skb(u32 mtu)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:852:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     852 | bool xsc_rx_is_linear_skb(u32 mtu)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1316:5: warning: no previous prototype for function 'xsc_eth_open_channel' [-Wmissing-prototypes]
    1316 | int xsc_eth_open_channel(struct xsc_adapter *adapter,
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1316:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1316 | int xsc_eth_open_channel(struct xsc_adapter *adapter,
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1527:5: warning: no previous prototype for function 'xsc_eth_open_channels' [-Wmissing-prototypes]
    1527 | int xsc_eth_open_channels(struct xsc_adapter *adapter)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1527:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1527 | int xsc_eth_open_channels(struct xsc_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1639:6: warning: no previous prototype for function 'xsc_eth_activate_channel' [-Wmissing-prototypes]
    1639 | void xsc_eth_activate_channel(struct xsc_channel *c)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1639:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1639 | void xsc_eth_activate_channel(struct xsc_channel *c)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1645:6: warning: no previous prototype for function 'xsc_eth_deactivate_channel' [-Wmissing-prototypes]
    1645 | void xsc_eth_deactivate_channel(struct xsc_channel *c)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1645:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1645 | void xsc_eth_deactivate_channel(struct xsc_channel *c)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1691:6: warning: no previous prototype for function 'xsc_eth_activate_priv_channels' [-Wmissing-prototypes]
    1691 | void xsc_eth_activate_priv_channels(struct xsc_adapter *adapter)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1691:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1691 | void xsc_eth_activate_priv_channels(struct xsc_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1706:6: warning: no previous prototype for function 'xsc_eth_deactivate_priv_channels' [-Wmissing-prototypes]
    1706 | void xsc_eth_deactivate_priv_channels(struct xsc_adapter *adapter)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1706:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1706 | void xsc_eth_deactivate_priv_channels(struct xsc_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:1849:5: warning: no previous prototype for function 'xsc_eth_change_link_status' [-Wmissing-prototypes]
    1849 | int xsc_eth_change_link_status(struct xsc_adapter *adapter)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1849:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1849 | int xsc_eth_change_link_status(struct xsc_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1906:6: warning: no previous prototype for function 'xsc_eth_event_handler' [-Wmissing-prototypes]
    1906 | void xsc_eth_event_handler(void *arg)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1906:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1906 | void xsc_eth_event_handler(void *arg)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1914:5: warning: no previous prototype for function 'xsc_eth_enable_nic_hca' [-Wmissing-prototypes]
    1914 | int xsc_eth_enable_nic_hca(struct xsc_adapter *adapter)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1914:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1914 | int xsc_eth_enable_nic_hca(struct xsc_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1976:5: warning: no previous prototype for function 'xsc_eth_disable_nic_hca' [-Wmissing-prototypes]
    1976 | int xsc_eth_disable_nic_hca(struct xsc_adapter *adapter)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1976:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1976 | int xsc_eth_disable_nic_hca(struct xsc_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2009:6: warning: no previous prototype for function 'xsc_eth_rss_params_change' [-Wmissing-prototypes]
    2009 | void xsc_eth_rss_params_change(struct xsc_adapter *adapter, u32 change, void *modify)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2009:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2009 | void xsc_eth_rss_params_change(struct xsc_adapter *adapter, u32 change, void *modify)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2319:6: warning: no previous prototype for function 'xsc_build_default_indir_rqt' [-Wmissing-prototypes]
    2319 | void xsc_build_default_indir_rqt(u32 *indirection_rqt, int len,
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2319:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2319 | void xsc_build_default_indir_rqt(u32 *indirection_rqt, int len,
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2417:5: warning: no previous prototype for function 'xsc_eth_nic_mtu_changed' [-Wmissing-prototypes]
    2417 | int xsc_eth_nic_mtu_changed(struct xsc_adapter *priv)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2417:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2417 | int xsc_eth_nic_mtu_changed(struct xsc_adapter *priv)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2480:5: warning: no previous prototype for function 'xsc_set_vf_mac' [-Wmissing-prototypes]
    2480 | int xsc_set_vf_mac(struct net_device *netdev, int vf, u8 *mac)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2480:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2480 | int xsc_set_vf_mac(struct net_device *netdev, int vf, u8 *mac)
         | ^
         | static 
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:2497:5: warning: no previous prototype for function 'xsc_get_vf_config' [-Wmissing-prototypes]
    2497 | int xsc_get_vf_config(struct net_device *dev,
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2497:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2497 | int xsc_get_vf_config(struct net_device *dev,
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2513:5: warning: no previous prototype for function 'set_feature_rxcsum' [-Wmissing-prototypes]
    2513 | int set_feature_rxcsum(struct net_device *netdev, bool enable)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2513:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2513 | int set_feature_rxcsum(struct net_device *netdev, bool enable)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2565:5: warning: no previous prototype for function 'xsc_eth_set_features' [-Wmissing-prototypes]
    2565 | int xsc_eth_set_features(struct net_device *netdev, netdev_features_t features)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2565:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2565 | int xsc_eth_set_features(struct net_device *netdev, netdev_features_t features)
         | ^
         | static 
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:2582:5: warning: no previous prototype for function 'xsc_select_queue' [-Wmissing-prototypes]
    2582 | u16 xsc_select_queue(struct net_device *dev, struct sk_buff *skb,
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2582:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2582 | u16 xsc_select_queue(struct net_device *dev, struct sk_buff *skb,
         | ^
         | static 
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:2591:10: warning: variable 'txq_ix' is uninitialized when used here [-Wuninitialized]
    2591 |                 return txq_ix;
         |                        ^~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2585:12: note: initialize the variable 'txq_ix' to silence this warning
    2585 |         int txq_ix, up = 0;
         |                   ^
         |                    = 0
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2771:24: warning: no previous prototype for function 'xsc_tirc_get_default_config' [-Wmissing-prototypes]
    2771 | struct xsc_tirc_config xsc_tirc_get_default_config(enum xsc_traffic_types tt)
         |                        ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2771:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2771 | struct xsc_tirc_config xsc_tirc_get_default_config(enum xsc_traffic_types tt)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2776:6: warning: no previous prototype for function 'xsc_build_rss_params' [-Wmissing-prototypes]
    2776 | void xsc_build_rss_params(struct xsc_rss_params *rss_params, u16 num_channels)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2776:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2776 | void xsc_build_rss_params(struct xsc_rss_params *rss_params, u16 num_channels)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2794:6: warning: no previous prototype for function 'xsc_eth_build_nic_params' [-Wmissing-prototypes]
    2794 | void xsc_eth_build_nic_params(struct xsc_adapter *adapter, u32 ch_num, u32 tc_num)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2794:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2794 | void xsc_eth_build_nic_params(struct xsc_adapter *adapter, u32 ch_num, u32 tc_num)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2816:6: warning: no previous prototype for function 'xsc_eth_build_nic_netdev' [-Wmissing-prototypes]
    2816 | void xsc_eth_build_nic_netdev(struct xsc_adapter *adapter)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2816:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2816 | void xsc_eth_build_nic_netdev(struct xsc_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2887:5: warning: no previous prototype for function 'xsc_eth_create_xdev_resources' [-Wmissing-prototypes]
    2887 | int xsc_eth_create_xdev_resources(struct xsc_core_device *xdev)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2887:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2887 | int xsc_eth_create_xdev_resources(struct xsc_core_device *xdev)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2908:5: warning: no previous prototype for function 'xsc_eth_init_nic_rx' [-Wmissing-prototypes]
    2908 | int xsc_eth_init_nic_rx(struct xsc_adapter *adapter)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2908:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2908 | int xsc_eth_init_nic_rx(struct xsc_adapter *adapter)
         | ^
         | static 
   47 warnings generated.
..


vim +1752 drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h

  1745	
  1746	static inline bool
  1747	is_support_rdma(struct xsc_core_device *dev)
  1748	{
  1749		if (!dev)
  1750			return false;
  1751	
> 1752		if (dev->caps.hw_feature_flag | XSC_HW_RDMA_SUPPORT)
  1753			return true;
  1754	
  1755		return false;
  1756	}
  1757	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
