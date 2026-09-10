Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7192046BA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 00:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789001633; cv=none; b=JOd9kpTNdJr3HhGd9cCkaOi2H+QeQ3cEe9htjOhKniLwefuJ7G+m3z9X29ApYG6N649XcRJvPD2/FcaHi20dMNJ+ZyVo9Hx602e7WjWDIBlVHLT1Ehe1NwaKHCBUJnjme1rcsejkhsjSoVV0Al84eDA6ECCVItS6PHdiPzGn1Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789001633; c=relaxed/simple;
	bh=osYntvbisMTIjo8nYdpoglKWkOmuargeUjJTLmC0r4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EQwZxf3OfgjV448v7O81jbG+pPh65Biax3RBF/fk6OZ0X8ULQUf6hMD4DIpLzZ5TGUOZyFEF1+draazxCnkC48sPoVOiiZBYoY4nCTwgN2WQgpnaosalzo95MIVzIXxDwWNR4nMdrURwjRX4UHAljCST7+icpgtvmwpJpmQ5vb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 11c4655eacb211f19a56ed5b684f684d-20260910
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:375c3246-2192-4018-9976-0b806a9c5b5b,IP:0,U
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
X-UUID: 11c4655eacb211f19a56ed5b684f684d-20260910
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1928730943; Thu, 10 Sep 2026 08:53:42 +0800
Message-ID: <1f3cbeb0-29ca-405e-8604-4a4fcb55e0a1@kylinos.cn>
Date: Thu, 10 Sep 2026 08:53:40 +0800
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
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Niklas Cassel <cassel@kernel.org>
References: <202609100732.jcpwPdM6-lkp@intel.com>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <202609100732.jcpwPdM6-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/10 07:15, kernel test robot 写道:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git for-next
> head:   d82c5cf658c306979c786a6702487cf9fbc2b5de
> commit: d82c5cf658c306979c786a6702487cf9fbc2b5de [7/7] ata: pata_parport: unregister devices on protocol unregister
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609100732.jcpwPdM6-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100732.jcpwPdM6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609100732.jcpwPdM6-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/ata/pata_parport/pata_parport.c: In function 'pi_remove_by_proto':
>    drivers/ata/pata_parport/pata_parport.c:621:17: error: implicit declaration of function 'pi_remove_one' [-Wimplicit-function-declaration]
hi Maintainer,
 I'm very sorry about this. I haven't had my physical machine with me
recently, so this patch hasn't been tested. What should I do now? Do I
need to revert this patch, or should I just fix this compilation error?

Pei.
Sorry again.>      621 |                 pi_remove_one(dev);
>          |                 ^~~~~~~~~~~~~
>    drivers/ata/pata_parport/pata_parport.c: At top level:
>>> drivers/ata/pata_parport/pata_parport.c:707:13: warning: conflicting types for 'pi_remove_one'; have 'void(struct device *)'
>      707 | static void pi_remove_one(struct device *dev)
>          |             ^~~~~~~~~~~~~
>    drivers/ata/pata_parport/pata_parport.c:707:13: error: static declaration of 'pi_remove_one' follows non-static declaration
>    drivers/ata/pata_parport/pata_parport.c:621:17: note: previous implicit declaration of 'pi_remove_one' with type 'void(struct device *)'
>      621 |                 pi_remove_one(dev);
>          |                 ^~~~~~~~~~~~~
> 
> 
> vim +707 drivers/ata/pata_parport/pata_parport.c
> 
> 246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  706  
> 246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23 @707  static void pi_remove_one(struct device *dev)
> 246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  708  {
> 246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  709  	struct ata_host *host = dev_get_drvdata(dev);
> 246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  710  	struct pi_adapter *pi = host->private_data;
> 246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  711  
> 246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  712  	ata_host_detach(host);
> 246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  713  	pi_disconnect(pi);
> 246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  714  	pi_release(pi);
> 246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  715  	device_unregister(dev);
> 5bc9e2d43f8610 drivers/ata/pata_parport/pata_parport.c Ondrej Zary 2023-03-14  716  	/* pata_parport_dev_release will do ida_free(dev->id) and kfree(pi) */
> 246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  717  }
> 246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  718  
> 
> :::::: The code at line 707 was first introduced by commit
> :::::: 246a1c4c6b7ffba88a2553d2b88f7b6280f253a2 ata: pata_parport: add driver (PARIDE replacement)
> 
> :::::: TO: Ondrej Zary <linux@zary.sk>
> :::::: CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

