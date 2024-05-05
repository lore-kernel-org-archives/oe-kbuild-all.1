Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849C5567F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 08:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714898614; cv=none; b=a8OjBpT2QInDitzZjRYWvsP1dIWTf/VaiAK3w4CK4g5hptpv3EymDR3l5BS+Haaw5l3JF/c8RmZ4MwS9OAfoyFuyVhCwQgGLY7JazXnkpzXUXmb3twSNeWiRdT4pb/WvW8wDIR/LHovweNmOKGCSR81tXfcB94O4Eki4CNsOCNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714898614; c=relaxed/simple;
	bh=O5+bvmfdVExG/EAbmeNv3poRJsvTkXwcWhp3xSLMFw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I9P8M1sUJOn7IsI9CoSa6N25Mj9EQsORaLPkGP2TIVD+EFNBpAJsujxaJ9l9zxhMlQrRcg1nZof0tLYSL0TqG2VFec2BC5/VbTCLEC+lMNiNum560dZ6rb/yloRkmfJjB+s/87DTJ787Vj3DTwoxuuF7U378LQ7VTLPJvx6uS40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=A+w0s+UT; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="A+w0s+UT"
Message-ID: <fe52e4b3-46ed-4bb4-842e-41121dc72bf0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1714898608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7IF0KGUJv0OyGtqZTBvYnl0RBdIjrhetfYgsEgyySGA=;
	b=A+w0s+UTw1uue3nciBe6pn/siLmd6q6lNfMQNjnKV1tDRd6tmWlUBuS7vf69+L7n5KoMm8
	ljUnE0Im1J6+SQUPGd1gRX6bKOQ08RqMrhcsmR11/QhKjC0WTzM9P8BFYJJ9mhk9fORLw7
	vxONtRfVEoNR285ONg/Mo7HF/er0Yi4=
Date: Sun, 5 May 2024 10:43:23 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] driver core: auxiliary bus: show auxiliary device
 IRQs
To: kernel test robot <lkp@intel.com>, Shay Drory <shayd@nvidia.com>,
 netdev@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 kuba@kernel.org, edumazet@google.com, gregkh@linuxfoundation.org,
 david.m.ertman@intel.com
Cc: oe-kbuild-all@lists.linux.dev, rafael@kernel.org, ira.weiny@intel.com,
 linux-rdma@vger.kernel.org, leon@kernel.org, tariqt@nvidia.com,
 Parav Pandit <parav@nvidia.com>
References: <20240503043104.381938-2-shayd@nvidia.com>
 <202405040108.NWUaSJgz-lkp@intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <202405040108.NWUaSJgz-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 2024/5/3 19:14, kernel test robot 写道:
> Hi Shay,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on driver-core/driver-core-testing]
> [also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus net/main net-next/main linus/master v6.9-rc6 next-20240503]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Shay-Drory/driver-core-auxiliary-bus-show-auxiliary-device-IRQs/20240503-123319
> base:   driver-core/driver-core-testing
> patch link:    https://lore.kernel.org/r/20240503043104.381938-2-shayd%40nvidia.com
> patch subject: [PATCH 1/2] driver core: auxiliary bus: show auxiliary device IRQs
> config: s390-randconfig-r081-20240503 (https://download.01.org/0day-ci/archive/20240504/202405040108.NWUaSJgz-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040108.NWUaSJgz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405040108.NWUaSJgz-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/base/auxiliary.c:182: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>      * Auxiliary devices can share IRQs. Expose to user whether the provided IRQ is
> 
> 
> vim +182 drivers/base/auxiliary.c
> 
>     180	
>     181	/**
 From the above, "/**" should be "/*"?

Zhu Yanjun
>   > 182	 * Auxiliary devices can share IRQs. Expose to user whether the provided IRQ is
>     183	 * shared or exclusive.
>     184	 */
>     185	static ssize_t auxiliary_irq_mode_show(struct device *dev,
>     186					       struct device_attribute *attr, char *buf)
>     187	{
>     188		struct auxiliary_irq_info *info =
>     189			container_of(attr, struct auxiliary_irq_info, sysfs_attr);
>     190	
>     191		if (refcount_read(xa_load(&irqs, info->irq)) > 1)
>     192			return sysfs_emit(buf, "%s\n", "shared");
>     193		else
>     194			return sysfs_emit(buf, "%s\n", "exclusive");
>     195	}
>     196	
> 

