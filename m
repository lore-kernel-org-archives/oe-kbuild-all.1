Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EE83C0C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 02:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718849723; cv=none; b=Sgaee1v1tbnQEAB1G/nTcrCskJqy7Zh1DO5GPrX5WUibdyWK79YRlR09AHjcpJ8pmOGSvx6DMaL2z/trTRCOIIky7S6kTlIFIzIIuy9q6lnEtCXAOEBOwXx3uUQGS9kHtbUqmaGU7GCa9PXLHn2LFYUfi2wN9/K3vq9+TY4QASU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718849723; c=relaxed/simple;
	bh=eo5Rs2EcLjDRPzkDOB/QMSF/xaaqVWsj76JR/MuKt94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANY4eGEu9lEp5t/YgP6AK0J06ZVkTEofFtxKEvVXjV5CUaLXfuBgbGrIdJsjuI7gurHiiJlqKZyP6B9RGWSRwP3C13BNfPC4pAnSvDlQ/kkAX77+dPpujSWkj1ZKPO1Ol9RV+1mfsnSGGeZ3MTuiHMGW/saIvOZfo5ddwjGs/e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2zS8DlL; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2zS8DlL"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5b96a781b63so138242eaf.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 19:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718849721; x=1719454521; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CRUkQdGOKU9OB0MqSqSfhBwPPa2DOFb6bMBOZf3RUNM=;
        b=A2zS8DlL0qYNl2pQslu51I2nt60cTCIlmdFw4B5RkP/E5TfisM5SAB9eUa9wMFf4XV
         Beu/HP+GCMvi5n/MSh1PBafgMTXaRt9i1A9bA5yRSUJ15asaMyoHBVhX1pEai65utibN
         vn8MO+OfnfBVrpVSgxGykfdBfmSjnN8rpgfnBPMgN88WK4lVzS8ObuWfTbIkgbbUlkHK
         j89ugAB/sIw0yA8pl3KyQ/QRZDpaJL814ZysKahoC+V4pGXw5rxuS1hg4/Qt2jY04b7l
         YPyqj18ojf8vb8iDNWXUQSseRwJZByZUT1WujjDQ7fssfnwR/Cdw5zX4gDZZmcEdWKAn
         4wSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718849721; x=1719454521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRUkQdGOKU9OB0MqSqSfhBwPPa2DOFb6bMBOZf3RUNM=;
        b=ChNnaZdLHT5plT/By5Cou4F9DfKYKPiBmjv6zRpV6XeGqLmoNAV8InBzSRV0lLNXW6
         3067aMGujca/UFBRJO+DBAhNlqT7TSaRFKzLSmV+GUf8zKWv29RQDSjjnjY+0vA0pugq
         P9bXUETCmZo0TXROTUXl+Yw96Q5kQJ2E3T1S+JQz7OC6l4PfTFe5LBLWDA9hFrMnNCR9
         ORW0hoNQHKMf86k12qRkitSWV65HKnoq2P0YCyHm495VGLRI8iVvjtD22poWGLsp7NNf
         W9nm2Ak3o/bHCf0JdAHCyi5boqLi6VLXVD4KYTbCaMzP1O8quYVhA5wY6zl3zbId4UkG
         QCiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQcYFGYVvU8SevUU9+lLHBuJ7ddbIMiOlSf1BYY7KRxB3QVW7ISBcmBFyhmT6q9IdHnoE9HaIEz3S+QapCmHPB9J8oXhnEiHc5uyzFoQ==
X-Gm-Message-State: AOJu0YxsKvaznhon8dbM+wWTHJAsxr+A/sh1hJzelEjhy3oyED+3IJ2P
	KUBcjPrqy0QsP97aJftHXRZYmSCVF7cT9rQjYTmTPkp3Rz2EM3ZNj+G1lpj9FO0aZnNjOCH/+GB
	pOOSWCIcTRp9yfylFmRoccyvseCU=
X-Google-Smtp-Source: AGHT+IHrnG/ArrsWeUTM5kYZ3ewBI2pHcNcWXpk3t2crBp2qN+iBG5ZBkS/qw5d1gUi8Lf5tvzb7mkZ9vhDLpLpIHi0=
X-Received: by 2002:a4a:2513:0:b0:5bb:1310:5f37 with SMTP id
 006d021491bc7-5c1adb1884cmr4687145eaf.3.1718849721163; Wed, 19 Jun 2024
 19:15:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240618164133.223194-2-linux.amoon@gmail.com> <202406200818.CQ7DXNSZ-lkp@intel.com>
In-Reply-To: <202406200818.CQ7DXNSZ-lkp@intel.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 20 Jun 2024 07:45:05 +0530
Message-ID: <CANAwSgS74LOHi+hXQAG9NH5PZ-OA+w21vXtucQagfsNtn-3Qww@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] PCI: rockchip: Simplify clock handling by using
 clk_bulk*() function
To: kernel test robot <lkp@intel.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi All,

On Thu, 20 Jun 2024 at 06:25, kernel test robot <lkp@intel.com> wrote:
>
> Hi Anand,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on pci/next]
> [also build test ERROR on pci/for-linus linus/master v6.10-rc4 next-20240619]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/PCI-rockchip-Simplify-reset-control-handling-by-using-reset_control_bulk-function/20240619-014145
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
> patch link:    https://lore.kernel.org/r/20240618164133.223194-2-linux.amoon%40gmail.com
> patch subject: [PATCH v1 1/3] PCI: rockchip: Simplify clock handling by using clk_bulk*() function
> config: arc-randconfig-001-20240620 (https://download.01.org/0day-ci/archive/20240620/202406200818.CQ7DXNSZ-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200818.CQ7DXNSZ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406200818.CQ7DXNSZ-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from drivers/pci/controller/pcie-rockchip-ep.c:20:
> >> drivers/pci/controller/pcie-rockchip.h:311:31: error: array type has incomplete element type 'struct clk_bulk_data'
>      311 |         struct  clk_bulk_data clks[ROCKCHIP_NUM_CLKS];
>          |                               ^~~~
>

I will try to fix this issue in the next version, once I get more
feedback on the rest of the changes.

>
> vim +311 drivers/pci/controller/pcie-rockchip.h
>
>    298
>    299  struct rockchip_pcie {
>    300          void    __iomem *reg_base;              /* DT axi-base */
>    301          void    __iomem *apb_base;              /* DT apb-base */
>    302          bool    legacy_phy;
>    303          struct  phy *phys[MAX_LANE_NUM];
>    304          struct  reset_control *core_rst;
>    305          struct  reset_control *mgmt_rst;
>    306          struct  reset_control *mgmt_sticky_rst;
>    307          struct  reset_control *pipe_rst;
>    308          struct  reset_control *pm_rst;
>    309          struct  reset_control *aclk_rst;
>    310          struct  reset_control *pclk_rst;
>  > 311          struct  clk_bulk_data clks[ROCKCHIP_NUM_CLKS];
>    312          struct  regulator *vpcie12v; /* 12V power supply */
>    313          struct  regulator *vpcie3v3; /* 3.3V power supply */
>    314          struct  regulator *vpcie1v8; /* 1.8V power supply */
>    315          struct  regulator *vpcie0v9; /* 0.9V power supply */
>    316          struct  gpio_desc *ep_gpio;
>    317          u32     lanes;
>    318          u8      lanes_map;
>    319          int     link_gen;
>    320          struct  device *dev;
>    321          struct  irq_domain *irq_domain;
>    322          int     offset;
>    323          void    __iomem *msg_region;
>    324          phys_addr_t msg_bus_addr;
>    325          bool is_rc;
>    326          struct resource *mem_res;
>    327  };
>    328
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks
-Anand
