Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C12D53363
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 15:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982546; cv=none; b=kozo9QHudvxc0SEz2nDEWdTvJH3KN/rbzhvTqSy9ghRlQhtHlJDaiigUI0UWxRLzp0fHLyiWxyUbC/W7uhZBE5sZDG/4h8NhOZ1RkxjPpLG+KOWa6j/PfcXHPO/G8gfmmC2ErdplR6oNAB9cvNHvuXFMiXwXli1riTaPhkzgShk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982546; c=relaxed/simple;
	bh=5rAiojQsTigWicXmeRh0G3zeGjSh5M2Z4R9eMuRP03o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2eMuistMpRT7iCxddbimlKbLlUK4cyeK20h9CNK3MoIU5iVUj/XuH6PnNAeK51W63N+92gQlCBZRyYBY8cGm7BCdgoLgsIZxpS3qSLgeGh9uxDUzZ+KfQfAQYygNMn8BqOfBGpRX+jdp+8oEujqa8hZ6b23z4sXILPJPj+f/vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z7nIzdXN; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z7nIzdXN"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-364cdfdaf91so1507144f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 08:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718982542; x=1719587342; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=//HkFPNKhQCDrBklAqKNRQHsY6okQNFrsrBgpNJVhqs=;
        b=z7nIzdXNmOdWduILk+7jtWqlqEZ1bL2+uGyAodaG0zvrxp9B9OUNvIp7Sgx3+cfqqx
         wNTbo0PRvfYv3I8s3/DJih6OI6WM26eWEwudHrPIfVd/gvxmQLAugXsodVIGflK4Cptc
         D+0qIc0u1YutEyaH5fMmVmbrIY0PRDaXeHBhn179Nbx4pcBycrcBob5mvuo9Lz/+yqEO
         PbAK68xLEWM8vPkh3V9Y2WLjbqObVGEcwlQwNnqqJDKDKHOLPPAPFRjnlt6MAasLX3hg
         4SiSZtwEskom5VfHhxdfOFThnHxJ2v00Ron5OIav8gI/dfMBvqIK+PoBAUoK4hTJ9GAf
         baiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982542; x=1719587342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=//HkFPNKhQCDrBklAqKNRQHsY6okQNFrsrBgpNJVhqs=;
        b=jPu03qEoQynYKHWUgtWDGgShYl8opVIRZTjzy9BWMPzt+JOw/ob7F9L4u+O4bMLmqH
         kO7mTEB5wiEeWpAvU7erB31gQ2PLUFDGX6v0zsMvJpjeny9fpgBXCfs87pXKVzcW1aFm
         +13uY7sLcOgfOF/lfNxCJHePNvH1F0vXY0IkisEyaLV/3Eql76W8oGCq48ZC2A2XZr5V
         uAbdguAL/5nuJX7ZJU7Hqv8rrEGcBPRIoo8UOyU0Z7oaQQYmmGeWxfXV06/XVBN/t1AJ
         pCd+nP3uxq/XKOuKFP5wW3k2jD/aGMSG1+eHEs16uLuL2x5LEjV2T2nQvX3s8lNegXm2
         04tw==
X-Gm-Message-State: AOJu0Yz5Ds/ERLqA0UGc8BE7bQ8L4Eq2E40n0tfXNvX29vdjzgc2INrv
	5W1ipebr9sSbYqPTHLj1vowCH6sp8wrXTSydvjklVJ6wVTl/3SDNpbdGEDzgOArrUdFEhloN1oW
	v1SKE/4X2
X-Google-Smtp-Source: AGHT+IEGnNGgEhdZNo+A4PyZkLewBw+hk+J0cWFK1e7wUugiFCIuZNoRwrcESwM31W13TJnjrOc5VA==
X-Received: by 2002:a5d:64c5:0:b0:363:7bbf:efcc with SMTP id ffacd0b85a97d-3637bbff072mr7044215f8f.62.1718982541786;
        Fri, 21 Jun 2024 08:09:01 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f679bsm2001097f8f.81.2024.06.21.08.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 08:09:01 -0700 (PDT)
Message-ID: <b0785dc2-aa91-4b81-9d5b-f49bb1ab6fb6@linaro.org>
Date: Fri, 21 Jun 2024 16:09:00 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] media: qcom: camss: Split testgen, RDI and RX for
 CSID 170
To: kernel test robot <lkp@intel.com>,
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 quic_hariramp@quicinc.com
References: <20240522154659.510-7-quic_grosikop@quicinc.com>
 <202405232059.8lLokYw2-lkp@intel.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <202405232059.8lLokYw2-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2024 13:59, kernel test robot wrote:
> Hi Gjorgji,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on media-tree/master]
> [also build test WARNING on linus/master next-20240523]
> [cannot apply to v6.9]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:https://github.com/intel-lab-lkp/linux/commits/Gjorgji-Rosikopulos/media-qcom-camss-Add-per-sub-device-type-resources/20240522-235220
> base:   git://linuxtv.org/media_tree.git master
> patch link:https://lore.kernel.org/r/20240522154659.510-7-quic_grosikop%40quicinc.com
> patch subject: [PATCH v4 6/8] media: qcom: camss: Split testgen, RDI and RX for CSID 170
> config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240523/202405232059.8lLokYw2-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405232059.8lLokYw2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot<lkp@intel.com>
> | Closes:https://lore.kernel.org/oe-kbuild-all/202405232059.8lLokYw2-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     drivers/media/platform/qcom/camss/camss-csid-gen2.c: In function '__csid_configure_rdi_stream':
>>> drivers/media/platform/qcom/camss/camss-csid-gen2.c:265:13: warning: variable 'phy_sel' set but not used [-Wunused-but-set-variable]
>       265 |         u32 phy_sel = 0;
>           |             ^~~~~~~

Gjorgji.

This appears to be a dead variable now.

I don't see a need to respin this series but, could you send a 
supplementary patch to fix this up ?

---
bod
