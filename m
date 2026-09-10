Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37E02F6562
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 01:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002250; cv=none; b=V56A6hoC3B4wn6OtsU84NzbZF8nFirGh2JCdATS2bmlESNV4loADMdIjA8LMVqmLC0Ufk7H/WK+q0kActv9HzbP8JuZp8qiXXir8S4EM8NiJc5o2Sl81CctO4qtdRw1Hcu4JW11+JH52g621dRKB8xZ2NsVfjuO7tPKCqbYq7tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002250; c=relaxed/simple;
	bh=esP/akggHOt1oGDBKEHDdxK9kFrVNK/FWhqTvjTT5I4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rsWiDwd3is+fHb7kWJtSBIzp2nlRDhngksAgRPr2uq4ella46NLMbWDd3DwEKK3zPnaDfYvzfN6Y1kPLmNaeaksTaAhlRGNHINxwQgYEL7K4ABot1uhVdH1K9V8vj1NOKKx4m4bOOfBBKQMb8eAn2qTVJI04tPiWXh3PkkmkhEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8325ddb2acb311f19a56ed5b684f684d-20260910
X-CID-CACHE: Type:Local,Time:202609100853+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:dffe4c17-aeae-4abd-80c0-75906b347ecd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:b08f5d50ae6a721fc859cb18919a7520,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|136|865|898,TC:nil,Content:0|15|16
	|52|99,EDM:-3|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8325ddb2acb311f19a56ed5b684f684d-20260910
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 485896929; Thu, 10 Sep 2026 09:04:02 +0800
Message-ID: <724b3577-4eed-4b05-98c3-b58690e11fbe@kylinos.cn>
Date: Thu, 10 Sep 2026 09:04:00 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [libata:for-next 7/7]
 drivers/ata/pata_parport/pata_parport.c:707:13: warning: conflicting types
 for 'pi_remove_one'; have 'void(struct device *)'
To: Niklas Cassel <cassel@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Damien Le Moal <dlemoal@kernel.org>
References: <202609100732.jcpwPdM6-lkp@intel.com>
 <1f3cbeb0-29ca-405e-8604-4a4fcb55e0a1@kylinos.cn> <aqIBzTU8VK4KQRrJ@ryzen>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <aqIBzTU8VK4KQRrJ@ryzen>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/10 09:03, Niklas Cassel 写道:
> On Thu, Sep 10, 2026 at 08:53:40AM +0800, Pei Xiao wrote:
>> 在 2026/9/10 07:15, kernel test robot 写道:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git for-next
>>> head:   d82c5cf658c306979c786a6702487cf9fbc2b5de
>>> commit: d82c5cf658c306979c786a6702487cf9fbc2b5de [7/7] ata: pata_parport: unregister devices on protocol unregister
>>> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609100732.jcpwPdM6-lkp@intel.com/config)
>>> compiler: m68k-linux-gcc (GCC) 16.1.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100732.jcpwPdM6-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202609100732.jcpwPdM6-lkp@intel.com/
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>    drivers/ata/pata_parport/pata_parport.c: In function 'pi_remove_by_proto':
>>>    drivers/ata/pata_parport/pata_parport.c:621:17: error: implicit declaration of function 'pi_remove_one' [-Wimplicit-function-declaration]
>> hi Maintainer,
>>  I'm very sorry about this. I haven't had my physical machine with me
>> recently, so this patch hasn't been tested. What should I do now? Do I
>> need to revert this patch, or should I just fix this compilation error?
> 
> I dropped this series from for-7.4.
> 
> Please send a new version that you have actually tested.
ok.>
> 
> Kind regards,
> Niklas

