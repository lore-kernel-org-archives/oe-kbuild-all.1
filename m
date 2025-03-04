Received: from mail-m3287.qiye.163.com (mail-m3287.qiye.163.com [220.197.32.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C34A1EC00F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 04:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741064207; cv=none; b=XQnAbX+zDSbMcJRp6go8UZhr3CURMCm8ciod5lHvEkmzN7Bcm5g6g/u7bNRi6GyvLwjykP2EwLybTBYdfqbfWNyEt8AzBtQ6MfZn0ao3QGDbowaCq3SlGJOm93YrfWcYyCwL7tYOxS5JrrGM6rSqijfaWMROmR0NkcMBQGuM/tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741064207; c=relaxed/simple;
	bh=jqA7VuUUo0LViOT1olz7KrXUF7d+iuGxUb5VxM46iC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k6Fz0OA2EaqMYIOtEuFIDu6fZ2dzieRHVlimwxIyG/CitKaBCVJLT92tX+fx60yFQlf1rO7ybbcyBp+o6oDiGykt7WXYof6X/WgIYwhEb0pEN1Zfmul0G4rR9dDAg7GQAG/bPvMCxtC5iPcEBD6OuKxxl93APIwGesJo0EW1n7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=A2HXZ2/p; arc=none smtp.client-ip=220.197.32.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="A2HXZ2/p"
Received: from [172.16.12.69] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id cd535e8b;
	Tue, 4 Mar 2025 11:40:58 +0800 (GMT+08:00)
Message-ID: <965c133c-9ef3-4186-b7c5-da7319ece845@rock-chips.com>
Date: Tue, 4 Mar 2025 11:40:47 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 7437/7719]
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:833:28: error: implicit
 declaration of function 'FIELD_PREP'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>
References: <202503040135.fgoyWdLB-lkp@intel.com>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <202503040135.fgoyWdLB-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkweGVYaQkxNQkkYQh1MTExWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	pVSktLVUpCS0tZBg++
X-HM-Tid: 0a955f3e122b09d6kunmcd535e8b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Phw6Tww5FTIKDU0UTRpRLCgu
	NyFPClFVSlVKTE9KS05CTU5CS01MVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBTklDSTcG
DKIM-Signature:a=rsa-sha256;
	b=A2HXZ2/pSAFr9I76vEYmRenfOaN2GajIjOaSUxhtpo11D04dSzRFryNZkTtyVvAQedWYCqfayUtSI3qRImKTdYLYMq9FZ0h4K7Rq4U3j7Dwg71Z4cn4enAOriA2CF/tINDunDFhP4YbC2KYNhJXApx1RHuV2iI/1yCmblAbch6Y=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=5J6K0GyNzhxUaKioYWsklePxuF6IEfvyyB6pQrnDHdA=;
	h=date:mime-version:subject:message-id:from;

Hi Heiko,


On 3/4/25 01:20, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d
> commit: 328e6885996ca2c6eb8b07d3c9bb1439fdcb088f [7437/7719] drm/rockchip: vop2: Add platform specific callback
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250304/202503040135.fgoyWdLB-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503040135.fgoyWdLB-lkp@intel.com/reproduce)

I can't reproduce this error on arm64 defconfig, so this let me wonder that should we
let drm/rockchip depends on ARCH_ROCKCHIP, so as to reduce the testing overhead on other
unrelated platforms?

> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503040135.fgoyWdLB-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     drivers/gpu/drm/rockchip/rockchip_vop2_reg.c: In function 'rk3568_set_intf_mux':
>>> drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:833:28: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
>       833 |                            FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_RGB_MUX, vp->id);
>           |                            ^~~~~~~~~~
> 
> 
> vim +/FIELD_PREP +833 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> 
>     819	
>     820	static unsigned long rk3568_set_intf_mux(struct vop2_video_port *vp, int id, u32 polflags)
>     821	{
>     822		struct vop2 *vop2 = vp->vop2;
>     823		struct drm_crtc *crtc = &vp->crtc;
>     824		u32 die, dip;
>     825	
>     826		die = vop2_readl(vop2, RK3568_DSP_IF_EN);
>     827		dip = vop2_readl(vop2, RK3568_DSP_IF_POL);
>     828	
>     829		switch (id) {
>     830		case ROCKCHIP_VOP2_EP_RGB0:
>     831			die &= ~RK3568_SYS_DSP_INFACE_EN_RGB_MUX;
>     832			die |= RK3568_SYS_DSP_INFACE_EN_RGB |
>   > 833				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_RGB_MUX, vp->id);
>     834			dip &= ~RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL;
>     835			dip |= FIELD_PREP(RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL, polflags);
>     836			if (polflags & POLFLAG_DCLK_INV)
>     837				regmap_write(vop2->sys_grf, RK3568_GRF_VO_CON1, BIT(3 + 16) | BIT(3));
>     838			else
>     839				regmap_write(vop2->sys_grf, RK3568_GRF_VO_CON1, BIT(3 + 16));
>     840			break;
>     841		case ROCKCHIP_VOP2_EP_HDMI0:
>     842			die &= ~RK3568_SYS_DSP_INFACE_EN_HDMI_MUX;
>     843			die |= RK3568_SYS_DSP_INFACE_EN_HDMI |
>     844				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_HDMI_MUX, vp->id);
>     845			dip &= ~RK3568_DSP_IF_POL__HDMI_PIN_POL;
>     846			dip |= FIELD_PREP(RK3568_DSP_IF_POL__HDMI_PIN_POL, polflags);
>     847			break;
>     848		case ROCKCHIP_VOP2_EP_EDP0:
>     849			die &= ~RK3568_SYS_DSP_INFACE_EN_EDP_MUX;
>     850			die |= RK3568_SYS_DSP_INFACE_EN_EDP |
>     851				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_EDP_MUX, vp->id);
>     852			dip &= ~RK3568_DSP_IF_POL__EDP_PIN_POL;
>     853			dip |= FIELD_PREP(RK3568_DSP_IF_POL__EDP_PIN_POL, polflags);
>     854			break;
>     855		case ROCKCHIP_VOP2_EP_MIPI0:
>     856			die &= ~RK3568_SYS_DSP_INFACE_EN_MIPI0_MUX;
>     857			die |= RK3568_SYS_DSP_INFACE_EN_MIPI0 |
>     858				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_MIPI0_MUX, vp->id);
>     859			dip &= ~RK3568_DSP_IF_POL__MIPI_PIN_POL;
>     860			dip |= FIELD_PREP(RK3568_DSP_IF_POL__MIPI_PIN_POL, polflags);
>     861			break;
>     862		case ROCKCHIP_VOP2_EP_MIPI1:
>     863			die &= ~RK3568_SYS_DSP_INFACE_EN_MIPI1_MUX;
>     864			die |= RK3568_SYS_DSP_INFACE_EN_MIPI1 |
>     865				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_MIPI1_MUX, vp->id);
>     866			dip &= ~RK3568_DSP_IF_POL__MIPI_PIN_POL;
>     867			dip |= FIELD_PREP(RK3568_DSP_IF_POL__MIPI_PIN_POL, polflags);
>     868			break;
>     869		case ROCKCHIP_VOP2_EP_LVDS0:
>     870			die &= ~RK3568_SYS_DSP_INFACE_EN_LVDS0_MUX;
>     871			die |= RK3568_SYS_DSP_INFACE_EN_LVDS0 |
>     872				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_LVDS0_MUX, vp->id);
>     873			dip &= ~RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL;
>     874			dip |= FIELD_PREP(RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL, polflags);
>     875			break;
>     876		case ROCKCHIP_VOP2_EP_LVDS1:
>     877			die &= ~RK3568_SYS_DSP_INFACE_EN_LVDS1_MUX;
>     878			die |= RK3568_SYS_DSP_INFACE_EN_LVDS1 |
>     879				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_LVDS1_MUX, vp->id);
>     880			dip &= ~RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL;
>     881			dip |= FIELD_PREP(RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL, polflags);
>     882			break;
>     883		default:
>     884			drm_err(vop2->drm, "Invalid interface id %d on vp%d\n", id, vp->id);
>     885			return 0;
>     886		}
>     887	
>     888		dip |= RK3568_DSP_IF_POL__CFG_DONE_IMD;
>     889	
>     890		vop2_writel(vop2, RK3568_DSP_IF_EN, die);
>     891		vop2_writel(vop2, RK3568_DSP_IF_POL, dip);
>     892	
>     893		return crtc->state->adjusted_mode.crtc_clock  * 1000LL;
>     894	}
>     895	
> 
