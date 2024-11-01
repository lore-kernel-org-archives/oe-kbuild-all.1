Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7661925A9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 12:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730463262; cv=none; b=tMMUSJCiE6mFKNR5oDYRayCnP+PRpv5CgjuxSWKiOpnkipKI8v/YTkRjGWajHEtFkgrJ4pv7ItGQ/gRPo34FUL7/qGfDUrt2gNdxY0lstLiuLjVM7n5apW8Bz0B6zWkGunDw4cu5BZgiRvjxSpblBVJNy0/jkXmUUAsvqQ+C/1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730463262; c=relaxed/simple;
	bh=p9DKxdVSBtQD6DXS5i3JPCzqn4/KGAK9P6m7WbcJMw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fyjAyrZAflkqbUs3UtwFx1OXvwZkh49ZSypr8GoyiH4BJuQq6ElWHjBoURz3XZR6h/Odsn8dSQhO7QkONA5DXjqJhgwqjYirPzVd4eN0T3LjTVVcIhL8GjVmFBUWl2oLFpQ7G6En26hDa6EYd7ffwscXKlHAnhAsUyMsfFnt5pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pfs9oiET; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pfs9oiET"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a0c7abaa6so207825966b.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 01 Nov 2024 05:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730463259; x=1731068059; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=afXS28WNzPIn8ZiAoXeQQ+AWZulWG4v7TMM2B1Nbx3U=;
        b=Pfs9oiETLB40yhxfa3o1Xo5DeOLSRWj82xEkux71ahjSmIYNxVrNO9iN0cjbo5GVya
         9NuOYZWbSWgmKKa/a3owUUgZXQyntvoglNvXxCV0i9EYMhGh2IIUCK4oDu4RbDr4YW6b
         6dJ3k8dyKkLmQTQaTkjO47XcaGNa7g7gokMUQr9CgHEEcADbRWmcCe0rJKO6MJmsW/tD
         va2+HumKZScu5tvdRLbSptTXuIdgXooN3bD4GCMsnAOI9tADt2pDKwe1h3rFtMzr/Ec0
         QcY6ID/5aVqbYAvbfxfTyCX2soFdsy2bm4u0u0DK7XenW52mJD73PUKmrky38jTvrrZo
         5e0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730463259; x=1731068059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=afXS28WNzPIn8ZiAoXeQQ+AWZulWG4v7TMM2B1Nbx3U=;
        b=UI5aYs3I+EViLBpp3Wyr7mvLV7NRrBoCbC2pClP9OwpFlhBRU3hB0VSCT6RaZJIOrE
         gHhtLJ3m2FUS547ZxuEc+yI25KbM/MdmizDimXuN9MW4P83kWg1OXbB7ovF+4oUdZoGP
         c/f3K3suEIgMuhIgj3nTxUf89BF8EbAP5pZwGGEodT4EpYeLFHRCA/ZysGvFt9Z4J61i
         U4005pL+OGbdQMN3eb7Arvnnh52BKlk0afINZ/hTr3sIjKTY4TDnhFt84fnjEbC25Zes
         ABS4csxHBp4gwu/ViLsse8Muqxs4aDOUBmwKYDEwEDHQ7iqsV5LHXrkErD0NeLoVv2jN
         DSKA==
X-Gm-Message-State: AOJu0YxeQCaZOELzbVvm5gwgWGj8N8dbxEuydEms10B0rT7VGw6l/7GE
	lkUY6YvNRs7h7yzZltN3HqnrZUBoPaRbHUse2l/0TXOWii2OwEZ1
X-Google-Smtp-Source: AGHT+IGswJw9DBDaL1k60WKA1olp/Z5xH9EPY//gHoHbDiGQFhhiaordtKUxXzGZhvoPWau6GTIcoQ==
X-Received: by 2002:a17:907:1c02:b0:a99:a9b6:2eb6 with SMTP id a640c23a62f3a-a9e652c179emr345249966b.0.1730463258564;
        Fri, 01 Nov 2024 05:14:18 -0700 (PDT)
Received: from [192.168.0.50] ([79.113.150.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565dfa80sm173888566b.130.2024.11.01.05.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 05:14:18 -0700 (PDT)
Message-ID: <fdec3e56-ee9f-4b44-bd61-cb8cfec5f2f8@gmail.com>
Date: Fri, 1 Nov 2024 14:14:14 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] wifi: rtw88: Enable the new RTL8821AU/RTL8812AU
 drivers
To: kernel test robot <lkp@intel.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ping-Ke Shih <pkshih@realtek.com>
References: <0b8e8093-8103-4999-86bf-0055ec52ea64@gmail.com>
 <202411010825.Kzdw5VeV-lkp@intel.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <202411010825.Kzdw5VeV-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/11/2024 02:35, kernel test robot wrote:
> Hi Bitterblue,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on wireless-next/main]
> [also build test ERROR on wireless/main linus/master v6.12-rc5 next-20241031]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Bitterblue-Smith/wifi-rtw88-Add-rtw8812a_table-c-h/20241031-023323
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
> patch link:    https://lore.kernel.org/r/0b8e8093-8103-4999-86bf-0055ec52ea64%40gmail.com
> patch subject: [PATCH v4 7/7] wifi: rtw88: Enable the new RTL8821AU/RTL8812AU drivers
> config: um-allyesconfig (https://download.01.org/0day-ci/archive/20241101/202411010825.Kzdw5VeV-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010825.Kzdw5VeV-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411010825.Kzdw5VeV-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>          |                             REG_RFE_CTRL_E
>    drivers/net/wireless/realtek/rtw88/rtw8821a.c:338:37: error: 'REG_IQK_COM64' undeclared (first use in this function)
>      338 |                 rtw_write32(rtwdev, REG_IQK_COM64, 0xfa000000);
>          |                                     ^~~~~~~~~~~~~

Ah, sorry, I didn't use --base. This series is supposed to be
applied on top of rtw-next, not wireless-next.
