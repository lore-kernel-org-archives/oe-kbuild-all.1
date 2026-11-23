Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440236;
	b=17I/Iferg9ign3uZeq4vEPttI1o6crKKc9EF2dMcBtXd9Yij2w/IjLn9wHx66obrvWEa
	 7x/S59iUbra9TkBrzwG/TCnL5jnx2sFPRxq3Q1e4WEHrmA/S/hh9e0SZ4T8Tiw8qCH8DD
	 C3uZ5PWNLvuwgDlhPuclvCRhpRCWFNNByhgKTgHZMqjiqs8gyCxSga5rvrDW6SFFA3vSm
	 On0HbNq+T/zO2sTIAs9HT42wvmm0OjkbME71iAV3lV+s8/hLVFC1lP2edEK6HJBlRcQsk
	 LG0K5H+gVsoEuajawC7obZtTq5zppwhqt27KyEtyR3t4SYaMtX+YYSnvdg+TZfSz76A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=cuP7SObGgNcigrigLRsAOfRGPC/Kfzad7ThJDALzqv8=;
	b=i3Bf7yX71IXLAQoinFnQPfmG6UyMQP+CxNO2E52IxV2uevzL7WhOmp5SUL3f+xxUgKEk
	 8y/DwpZwAfIJH/Nk43cv4J5MHbIrHMp4QDKNCNNPxar8vh34bKDZuTyYrT3J/47Oh1Zkp
	 mPOXUyHagtdqMpjYD2Q9Nvu42wDeGJQ4K9s2jqoTy3Y+sH/bG77fqsCUL1Sx8uBuyP4IY
	 v8paorrcB0aP5ICyi+8PdcS1hXEzLWiLSnCGJCVGPFOONtEb/ytMefVv1B1eZFosJ4YpS
	 E3+NyWz6CIki+wAqzwGiEL92/fodhX4dim9MFSWdIVX1s829/FRvI9+bs9eV0z9+epQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gK69V6l3;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46511606A321
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 13:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46511606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gK69V6l3
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso3836750a12.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 05:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440235; x=1796045035; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cuP7SObGgNcigrigLRsAOfRGPC/Kfzad7ThJDALzqv8=;
        b=gK69V6l381KNE2w/4EyX58WRPlX9DHr9B9thQfoPhTrisKJrm+R1IU3AWeCE63uG1S
         M3mX353uAjvKnSJSh/9vKwhjKIw1LBk4q1Rgla+tuUyNf2XB+PJfQkPN82VUJ3qsSKDz
         SgsNbrVHDqdRpwSHKE/sljCUZlTjRwCS1bSQdXwZ4xuueT8ArMcsC7U3XX8tKdHa7Q6k
         XmDdA84JxRf64msxELmtQbxQneZc2SvfkyjNYADfvUMxjwY5z7LXuZNb+nUeujqdfbvd
         hSCf1tMt9d9CkjsSzNm5qNiY7ZsRwsUYqcq6VfTZJaEs6mr56IgHeIduDV4mGe6KNGhA
         /Pnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440235; x=1796045035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cuP7SObGgNcigrigLRsAOfRGPC/Kfzad7ThJDALzqv8=;
        b=oi7zmgOiyULFtl6qVQCpfoNuGj0W1SQxLcxqaZvhmQIRrJk4ZcBIkb3tET+e3MyStf
         BPd/xWbpY7DsIucXWkFD1DOHijh+FixlnRvklzlPp826qxby7Ek3hzLigeplXaY6XZAD
         oVsLhaGdE1s4/+hznUHy3pwmYn3QBTiiLEcotkb6ssI+ufYh9kR5zTGKkVOVYq2E5xSD
         ML3aH2sL96APRbBPEuz0y7GM3AqaQrW9kLHsgDbn+NL6RxWuU1cih1JeGFXaVHchvfNu
         7Nt3DDb6qkePvK1QRvzJqaiFFEwem0lDO/R5PCIva5OCsHLYqFJoMCc5y3t1+GxxRtmG
         wwbA==
X-Forwarded-Encrypted: i=1; AL+hErFvrl7cavelTok4NTXtHdWYRagm3iH3lCjW0U25yXV6dQR+ag6/iIPobhc2CQFL/4hutORDxo2lp2XkBjJt@lists.linux.dev
X-Gm-Message-State: APuU4Z+3b5ltCAap2izTw4Vv7z5RhmNyq3CaDdW5udHt9UQwjNvtSmrf
	l/QAR6OOoeeixLCoOMkyJkVxOam1A4g7itmstG1EJ+uY+tR/zIFZxdRw
X-Gm-Gg: AZFdTZdnXjGK6cqQnlupboRgDOtbZACGnI2tWC/zpxYojflhw7w2sBz3Cahme0TL+uT
	NXuwLYwd/RUffDj46F7KFKr3/HMEf7HfQMp4s4JWBdCs1SRYXBOpAgIyEdXNshlYpMxZdtRPT8A
	Ny0l8SVgktaliX2N5jwRDv84ZrI3DcXxOlLDN1G/ALINd7VSlwOVNi85M7L5ERF9B4xDtur9jpM
	Z4AZgpFT12mEK03+rC/BwaVYb+DhU06ChkVwFjEw3aXH3HbovxWJsQ8Gm/xe3aMk1HdCKM+f3vp
	bq9PXMKOSIzlnqiBFqo6bX9CVWOMiy5mBHdS+n9Txh/lz7RCtAtw7LlqoP/Yreuqd7iSenyLcGa
	NRPlxH1UNE+jxUU0YkPDKApB94kzpGAw5X+kLWDX/0DywZ1mHgrZs51ZL6FE3CvpOXLan9PJ+ml
	BsNhD47Rm9nHw1jCjFLky+Jwr00k8ZkPObxjPxZhcbHPwJk4PcYZcV5AnMCqzyXPYCpZKpXV9fE
	qR7kR0e/FryZ6T58Qf94vE4o+xZE3Jg3lPdh7IWnmaLeh9IC1j/XQaC2mCLKoroa1twA/0BmGgA
	hOp96OmB2ml5iZiHyluXLwJBk23lHEoYylNiiW/22JFkF7QHZwsGv9mKyumdG7CsCVCeUWgxa7B
	SZ0R7VsVh3Sq53jpIjc5m+sBWgyo8wGGV0q+nIiQryazGKejb1IX/x3v0bViOXVJppMI=
X-Received: by 2002:a05:6402:210e:b0:6ba:9d0c:cc83 with SMTP id 4fb4d7f45d1cf-6ba9d0ccee5mr3026054a12.31.1795440234436;
        Mon, 23 Nov 2026 05:23:54 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36d730d1sm5327255a12.0.2026.11.23.05.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:23:53 -0800 (PST)
Date: Mon, 23 Nov 2026 16:23:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Chengwen Feng <fengchengwen@huawei.com>,
	alex@shazbot.org, jgg@ziepe.ca, helgaas@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	wathsala.vithanage@arm.com, wei.huang2@amd.com, zhipingz@meta.com,
	wangzhou1@hisilicon.com, wangyushan12@huawei.com,
	liuyonglong@huawei.com, kvm@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v21 10/13] vfio/pci: Add IV-ST TPH policy and TPH_PROGRAM
 batch programming support
Message-ID: <20261123133843.7qO4iqGj-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118091238.45992-11-fengchengwen@huawei.com>

Hi Chengwen,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chengwen-Feng/PCI-TPH-Fix-pcie_tph_get_st_table_loc-field-extraction/20261118-171226
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/20261118091238.45992-11-fengchengwen%40huawei.com
patch subject: [PATCH v21 10/13] vfio/pci: Add IV-ST TPH policy and TPH_PROGRAM batch programming support
config: xtensa-randconfig-2200-20261123 (https://download.01.org/0day-ci/archive/20261123/20261123133843.7qO4iqGj-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261123133843.7qO4iqGj-lkp@intel.com/

New smatch warnings:
drivers/vfio/pci/vfio_pci_core.c:1889 vfio_pci_core_feature_tph_program() warn: check sign expansion for '-1'
drivers/vfio/pci/vfio_pci_core.c:1890 vfio_pci_core_feature_tph_program() error: we previously assumed 'src_handle' could be null (see line 1873)

vim +1889 drivers/vfio/pci/vfio_pci_core.c

7f5a45f0971e7a Chengwen Feng 2026-11-18  1811  static int vfio_pci_core_feature_tph_program(struct vfio_pci_core_device *vdev,
7f5a45f0971e7a Chengwen Feng 2026-11-18  1812  			u32 flags,
7f5a45f0971e7a Chengwen Feng 2026-11-18  1813  			struct vfio_device_feature_tph_program __user *arg,
7f5a45f0971e7a Chengwen Feng 2026-11-18  1814  			size_t argsz)
7f5a45f0971e7a Chengwen Feng 2026-11-18  1815  {
7f5a45f0971e7a Chengwen Feng 2026-11-18  1816  	struct vfio_device_feature_tph_program program;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1817  	u32 user_flags, src_mask, st_size;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1818  	struct pci_dev *pdev = vdev->pdev;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1819  	bool extended, stop_on_zero;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1820  	u32 *src_handle = NULL;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1821  	int ret, i, k, written;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1822  	u16 *tags = NULL;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1823  	u16 cmd;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1824  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1825  	if (!vdev->tph_opt_in ||
7f5a45f0971e7a Chengwen Feng 2026-11-18  1826  		!vfio_pci_tph_has_architected_st(vdev))
7f5a45f0971e7a Chengwen Feng 2026-11-18  1827  		return -EOPNOTSUPP;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1828  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1829  	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_SET,
7f5a45f0971e7a Chengwen Feng 2026-11-18  1830  				 sizeof(program));
7f5a45f0971e7a Chengwen Feng 2026-11-18  1831  	if (ret != 1)
7f5a45f0971e7a Chengwen Feng 2026-11-18  1832  		return ret;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1833  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1834  	if (copy_from_user(&program, arg, sizeof(program)))
7f5a45f0971e7a Chengwen Feng 2026-11-18  1835  		return -EFAULT;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1836  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1837  	user_flags = program.flags;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1838  	extended = !!(user_flags & VFIO_DEVICE_TPH_EXTENDED);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1839  	if (extended && !pcie_ext_tph_supported(vdev->pdev))
7f5a45f0971e7a Chengwen Feng 2026-11-18  1840  		return -EOPNOTSUPP;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1841  	user_flags &= ~VFIO_DEVICE_TPH_EXTENDED;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1842  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1843  	stop_on_zero = !!(user_flags & VFIO_DEVICE_TPH_REQUIRE_ST);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1844  	if (stop_on_zero && (user_flags & VFIO_DEVICE_TPH_SRC_NONE))
7f5a45f0971e7a Chengwen Feng 2026-11-18  1845  		return -EINVAL;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1846  	user_flags &= ~VFIO_DEVICE_TPH_REQUIRE_ST;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1847  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1848  	src_mask = vfio_pci_tph_get_src_mask(vdev);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1849  	if (user_flags & ~src_mask || !is_power_of_2(user_flags))
7f5a45f0971e7a Chengwen Feng 2026-11-18  1850  		return -EINVAL;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1851  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1852  	st_size = vfio_pci_tph_get_st_table_size(vdev);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1853  	if (program.start >= st_size || program.count == 0 ||
7f5a45f0971e7a Chengwen Feng 2026-11-18  1854  		program.count > st_size - program.start)
7f5a45f0971e7a Chengwen Feng 2026-11-18  1855  		return -EINVAL;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1856  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1857  	if (!(user_flags & VFIO_DEVICE_TPH_SRC_NONE)) {
7f5a45f0971e7a Chengwen Feng 2026-11-18  1858  		src_handle = memdup_array_user(u64_to_user_ptr(program.srcs),
7f5a45f0971e7a Chengwen Feng 2026-11-18  1859  					       program.count, sizeof(u32));
7f5a45f0971e7a Chengwen Feng 2026-11-18  1860  		if (IS_ERR(src_handle))
7f5a45f0971e7a Chengwen Feng 2026-11-18  1861  			return PTR_ERR(src_handle);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1862  	}
7f5a45f0971e7a Chengwen Feng 2026-11-18  1863  	tags = kcalloc(program.count, sizeof(u16), GFP_KERNEL_ACCOUNT);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1864  	if (!tags) {
7f5a45f0971e7a Chengwen Feng 2026-11-18  1865  		ret = -ENOMEM;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1866  		goto out;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1867  	}
7f5a45f0971e7a Chengwen Feng 2026-11-18  1868  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1869  	cpus_read_lock();
7f5a45f0971e7a Chengwen Feng 2026-11-18  1870  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1871  	for (i = 0; i < program.count; i++) {
7f5a45f0971e7a Chengwen Feng 2026-11-18  1872  		ret = vfio_pci_tph_resolve_st_tag(pdev, user_flags,
7f5a45f0971e7a Chengwen Feng 2026-11-18 @1873  						src_handle ? src_handle[i] : 0,
7f5a45f0971e7a Chengwen Feng 2026-11-18  1874  						extended, &tags[i]);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1875  		if (ret || (stop_on_zero && tags[i] == 0))
7f5a45f0971e7a Chengwen Feng 2026-11-18  1876  			break;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1877  	}
7f5a45f0971e7a Chengwen Feng 2026-11-18  1878  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1879  	if (i > 0) {
7f5a45f0971e7a Chengwen Feng 2026-11-18  1880  		mutex_lock(&vdev->tph_lock);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1881  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1882  		cmd = vfio_pci_memory_lock_and_enable(vdev);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1883  		ret = written = pcie_tph_set_st_entries(pdev, program.start, i,
7f5a45f0971e7a Chengwen Feng 2026-11-18  1884  							tags);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1885  		vfio_pci_memory_unlock_and_restore(vdev, cmd);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1886  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1887  		if (written > 0) {
7f5a45f0971e7a Chengwen Feng 2026-11-18  1888  			for (k = 0; k < written; k++)
7f5a45f0971e7a Chengwen Feng 2026-11-18 @1889  				vdev->tph_st_cpu[program.start + k] =
7f5a45f0971e7a Chengwen Feng 2026-11-18 @1890  					(tags[k] == 0) ? -1 : src_handle[k];

tph_st_cpu[] is an array of s64 but because of sign expansion
instead of saving -1 to it, we save UINT_MAX.

Smatch is also complaining that src_handle[] might be NULL but that
might be a false positive...  (probably is).

7f5a45f0971e7a Chengwen Feng 2026-11-18  1891  		}
7f5a45f0971e7a Chengwen Feng 2026-11-18  1892  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1893  		mutex_unlock(&vdev->tph_lock);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1894  	}
7f5a45f0971e7a Chengwen Feng 2026-11-18  1895  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1896  	cpus_read_unlock();
7f5a45f0971e7a Chengwen Feng 2026-11-18  1897  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1898  out:
7f5a45f0971e7a Chengwen Feng 2026-11-18  1899  	kfree(tags);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1900  	kfree(src_handle);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1901  	return ret;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1902  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

