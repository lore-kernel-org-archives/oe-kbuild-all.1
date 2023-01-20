Received: from post.baikalelectronics.com (post.baikalelectronics.com [213.79.110.86])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B0C1362
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 10:31:17 +0000 (UTC)
Received: from post.baikalelectronics.com (localhost.localdomain [127.0.0.1])
	by post.baikalelectronics.com (Proxmox) with ESMTP id DC299E0EB1;
	Fri, 20 Jan 2023 13:22:21 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	baikalelectronics.ru; h=cc:cc:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=post; bh=x0oVDqTxP8lSmGUL3mEt
	Wmsc4anDZOd+sLNYKYJ41eI=; b=Fn/LhVTQu2SP45NQDzJgaDjXPZmPzSDriTU9
	qTp93PgqVQNxHlQoMnZCt8IaoxqgSYMKn9E0dprdtsgzhac6fkrQn8xq3ZDUBbaW
	nYIP3ET2lSw8gMjVYVOuSLujDWSiVH1H7q1wMxHfxFEqK0lrLDzuyOdExbTU7iNr
	oMp+FLw=
Received: from mail.baikal.int (mail.baikal.int [192.168.51.25])
	by post.baikalelectronics.com (Proxmox) with ESMTP id C92B0E0E1D;
	Fri, 20 Jan 2023 13:22:21 +0300 (MSK)
Received: from mobilestation (10.8.30.26) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 20 Jan 2023 13:22:21 +0300
Date: Fri, 20 Jan 2023 13:22:21 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>, Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
Subject: Re: [krzk-github:wip/qcom-rt 85/380]
 drivers/pci/controller/dwc/pcie-designware.c:733:27: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <20230120102221.kax3doddb4nsmqo6@mobilestation>
References: <202301192348.JYHqRRcu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202301192348.JYHqRRcu-lkp@intel.com>
X-Originating-IP: [10.8.30.26]
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)

On Thu, Jan 19, 2023 at 11:19:46PM +0800, kernel test robot wrote:
> tree:   https://github.com/krzk/linux wip/qcom-rt
> head:   6880445158dd6376c96b5898fa41a7a3f8898b7d
> commit: 3ffee7408c93dd4e2f70e400b6327bae3ec2fc9a [85/380] PCI: dwc: Add DW eDMA engine support
> config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20230119/202301192348.JYHqRRcu-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.4-39-gce1a6720-dirty
>         # https://github.com/krzk/linux/commit/3ffee7408c93dd4e2f70e400b6327bae3ec2fc9a
>         git remote add krzk-github https://github.com/krzk/linux
>         git fetch --no-tags krzk-github wip/qcom-rt
>         git checkout 3ffee7408c93dd4e2f70e400b6327bae3ec2fc9a
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/pci/controller/dwc/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> sparse warnings: (new ones prefixed by >>)
> >> drivers/pci/controller/dwc/pcie-designware.c:733:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *vaddr @@     got void * @@
>    drivers/pci/controller/dwc/pcie-designware.c:733:27: sparse:     expected void [noderef] __iomem *vaddr
>    drivers/pci/controller/dwc/pcie-designware.c:733:27: sparse:     got void *
>    drivers/pci/controller/dwc/pcie-designware.c:744:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *vaddr @@     got void * @@
>    drivers/pci/controller/dwc/pcie-designware.c:744:27: sparse:     expected void [noderef] __iomem *vaddr
>    drivers/pci/controller/dwc/pcie-designware.c:744:27: sparse:     got void *

Fixed in v9 of the series:
https://lore.kernel.org/linux-pci/20230113171409.30470-24-Sergey.Semin@baikalelectronics.ru/
Please update your WIP branch.

-Serge(y)

> 
> vim +733 drivers/pci/controller/dwc/pcie-designware.c
> 
>    723	
>    724	static int dw_pcie_edma_ll_alloc(struct dw_pcie *pci)
>    725	{
>    726		struct dw_edma_region *ll;
>    727		dma_addr_t paddr;
>    728		int i;
>    729	
>    730		for (i = 0; i < pci->edma.ll_wr_cnt; i++) {
>    731			ll = &pci->edma.ll_region_wr[i];
>    732			ll->sz = DMA_LLP_MEM_SIZE;
>  > 733			ll->vaddr = dmam_alloc_coherent(pci->dev, ll->sz,
>    734							&paddr, GFP_KERNEL);
>    735			if (!ll->vaddr)
>    736				return -ENOMEM;
>    737	
>    738			ll->paddr = paddr;
>    739		}
>    740	
>    741		for (i = 0; i < pci->edma.ll_rd_cnt; i++) {
>    742			ll = &pci->edma.ll_region_rd[i];
>    743			ll->sz = DMA_LLP_MEM_SIZE;
>    744			ll->vaddr = dmam_alloc_coherent(pci->dev, ll->sz,
>    745							&paddr, GFP_KERNEL);
>    746			if (!ll->vaddr)
>    747				return -ENOMEM;
>    748	
>    749			ll->paddr = paddr;
>    750		}
>    751	
>    752		return 0;
>    753	}
>    754	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
> 

