Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CB0361645
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 12:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773835252; cv=none; b=GRkWgoTnt+aeOLGgRTszLtkPqV9DAskj+91g4G8KYR1E3t8X7cirXgp6U1oHGEpzZCRJuOqEbujIVsCpg8LImTZCgF5/B4NeTzXzhzhrZTNwmio0HdM6DysJd4UshN2Br8t7vHzT1A5HEvPs33G8mkv4G3CMeN4aq54CgCwvGOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773835252; c=relaxed/simple;
	bh=+rKwKx6789VqwiXlyRj4118r4AS/bxjKbPNQDrmouyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVKNIJ6/vuvoV9AzcSGik4xdyBwku61D5K8cOnKEQEJWxfQhXOdly+nvcjGSJJ1SGLxGUEbAuJo06oiu0ItMB3KmLE6guWDXM8jBhNosyV+/nT52MMxqnjyj1wH82TQsPrcTt/1vORsD93wuXuYpCsSrU05RjxJbF9g8B379Wfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q6vitlW3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q6vitlW3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A4EC19421;
	Wed, 18 Mar 2026 12:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773835252;
	bh=+rKwKx6789VqwiXlyRj4118r4AS/bxjKbPNQDrmouyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q6vitlW3RU72nl5n9+AqTHNw11bGguYP9EUgeioKeciB8wHlcnCxMWWLMG8/x9qBo
	 665Yy8v7zf3odHY+scekf8rU/sD1KN30cq9PpkK3HUR3Y+zcrXyq0cOWH9HMIqS9x6
	 uuIjVnHJ8TvvfpcuwfUyltxU6yL8VhslEbNvw4RV6LgaPQGYhCa8iKm5FLHEfRtMLm
	 /vgCrQPUBjSLe7fH6aQhhOTZV5y/4Eds1rUtj2SwpFAHDJGm8GeVW3K/LQqyvAq3wW
	 M05dMZbigWWtQTC+1k+4wfyAqoJa5ouY73ucjwEQMaodLl6xsmk31118pa2afo0oT1
	 IBqc+OJlO2JjQ==
Date: Wed, 18 Mar 2026 17:30:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: zhangsenchuan <zhangsenchuan@eswincomputing.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Yu Ning <ningyu@eswincomputing.com>, Yanghui Ou <ouyanghui@eswincomputing.com>
Subject: Re: [linux-next:master 5071/6828]
 drivers/pci/controller/dwc/pcie-eswin.c:381:1: sparse: sparse: symbol
 'eswin_pcie_pm' was not declared. Should it be static?
Message-ID: <ossm446mzzxxkd6mzhzdtkdha2fhsqbc33iye5raugsrdesj4d@r6vkmxqlzid2>
References: <202603180642.1rALz4hC-lkp@intel.com>
 <544bb65e.4518.19cff2ac14f.Coremail.zhangsenchuan@eswincomputing.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <544bb65e.4518.19cff2ac14f.Coremail.zhangsenchuan@eswincomputing.com>

On Wed, Mar 18, 2026 at 12:18:38PM +0800, zhangsenchuan wrote:
> 
> 
> 
> > -----Original Messages-----
> > From: "kernel test robot" <lkp@intel.com>
> > Send time:Wednesday, 18/03/2026 06:29:56
> > To: "Senchuan Zhang" <zhangsenchuan@eswincomputing.com>
> > Cc: oe-kbuild-all@lists.linux.dev, "Manivannan Sadhasivam" <mani@kernel.org>, "Yu Ning" <ningyu@eswincomputing.com>, "Yanghui Ou" <ouyanghui@eswincomputing.com>
> > Subject: [linux-next:master 5071/6828] drivers/pci/controller/dwc/pcie-eswin.c:381:1: sparse: sparse: symbol 'eswin_pcie_pm' was not declared. Should it be static?
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   8e5a478b6d6a5bb0a3d52147862b15e4d826af19
> > commit: cbbe59fa04b5d9f8e11138df4591653f7d2f8351 [5071/6828] PCI: Add ESWIN PCIe Root Complex driver
> > config: sparc64-randconfig-r122-20260318 (https://download.01.org/0day-ci/archive/20260318/202603180642.1rALz4hC-lkp@intel.com/config)
> > compiler: sparc64-linux-gcc (GCC) 11.5.0
> > sparse: v0.6.5-rc1
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180642.1rALz4hC-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202603180642.1rALz4hC-lkp@intel.com/
> > 
> > sparse warnings: (new ones prefixed by >>)
> > >> drivers/pci/controller/dwc/pcie-eswin.c:381:1: sparse: sparse: symbol 'eswin_pcie_pm' was not declared. Should it be static?
> > 
> > vim +/eswin_pcie_pm +381 drivers/pci/controller/dwc/pcie-eswin.c
> > 
> >    380	
> >  > 381	DEFINE_NOIRQ_DEV_PM_OPS(eswin_pcie_pm, eswin_pcie_suspend_noirq,
> >    382				eswin_pcie_resume_noirq);
> >    383	
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> Hi Mani,
> 
> The kernel test robot detected a warning. I reproduced the issue and it seems 
> that a "static" keyword might be needed. I'm not sure if I have the permission
> to upload the code to the controller/dwc-eswin branch and fix this warning:
> 
> 
> 
> -DEFINE_NOIRQ_DEV_PM_OPS(eswin_pcie_pm, eswin_pcie_suspend_noirq,
> -                        eswin_pcie_resume_noirq);
> 
> +static DEFINE_NOIRQ_DEV_PM_OPS(eswin_pcie_pm, eswin_pcie_suspend_noirq,
> +                               eswin_pcie_resume_noirq);

Fixed it in the tree, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்
