Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD65E17B50E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 07:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728458088; cv=none; b=beFHCOAj8BMwHqUPcSH6vUP/N1D6tia2v3qlnxkM27PXBtLa8yQ2GCdzz9K9MClGc40BJiFeq+GgWH8TJHx6QY/ctdwW9vT8mRgnBHXnZJZulqVkTUbaOSb64/kYbUjGLdFR6AYxcT98/qDTp16fGWw3YCeikwdWPr7C4uCTqVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728458088; c=relaxed/simple;
	bh=LXjCxTxEZ4EFDFCPDLbqJMHzz37kfQdxq1iVdQaNij4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQQVcu5wptMJA9xH7j5ShQ/v3ivPsvqoeUreqSlRkRZnz4fEdGlC0oSvs6fpB5g8fCF5ITg6Ivdu9oAT1VxIDQ0zcIVxAp3ZczZvrX/zTGO06lYlyAwUvPDKHC0DhRygwbxmH2RL6Cxnr8R0E2WTAWUIeOyZPsy+6c+kJW9yOLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khyORR7I; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khyORR7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728458087; x=1759994087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LXjCxTxEZ4EFDFCPDLbqJMHzz37kfQdxq1iVdQaNij4=;
  b=khyORR7ID7oKSn0n24M3sszn9aZQRYHUFVa18178erqfbMuzScMBqBMY
   815ztjwM94TlmN0mnnnnOvDzNLivEmB6/2UA8p6SJRm3pg51RvSjmZ7f1
   1Z7vZrRcPLKKjK8dQypqmA90Sfda9wAYz1zbuInfGm6H4YjVGrn/5H2n7
   RnAUyZbRTX5VjeAqitu+lH7NyfyWtINczXOuuXnNP7KWmRdfbJywdOXRD
   x/x1EvOZH1eb/EUczhBF4ocGNy61Txrqky63ajkepzUU3yVuuK6jVqeOD
   kY68vtJ4K6L6pyWomM9/riqqNFtoN43Ol8x/MHvad1BzzRmdxB54hyJIY
   Q==;
X-CSE-ConnectionGUID: elT50NQgTDyw+EMaHA2srQ==
X-CSE-MsgGUID: tzROiP/7TJalma2wNu1uHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38326949"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="38326949"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 00:14:45 -0700
X-CSE-ConnectionGUID: d3BkGnkPQY6rRY8C4ou4jg==
X-CSE-MsgGUID: fdxnATJ7QL2ATpFSdHg1QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="80140441"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Oct 2024 00:14:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syQu4-0008vM-2B;
	Wed, 09 Oct 2024 07:14:36 +0000
Date: Wed, 9 Oct 2024 15:13:43 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Vetter <jvetter@kalrayinc.com>, Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v8 01/14] Consolidate IO memcpy/memset into iomap_copy.c
Message-ID: <202410091406.PM7WcKcj-lkp@intel.com>
References: <20241008075023.3052370-2-jvetter@kalrayinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008075023.3052370-2-jvetter@kalrayinc.com>

Hi Julian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes arm64/for-next/core deller-parisc/for-next s390/features mtd/mtd/next mtd/mtd/fixes linus/master arm/for-next arm/fixes v6.12-rc2 next-20241008]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Julian-Vetter/Consolidate-IO-memcpy-memset-into-iomap_copy-c/20241008-163134
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20241008075023.3052370-2-jvetter%40kalrayinc.com
patch subject: [PATCH v8 01/14] Consolidate IO memcpy/memset into iomap_copy.c
config: x86_64-randconfig-121-20241009 (https://download.01.org/0day-ci/archive/20241009/202410091406.PM7WcKcj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410091406.PM7WcKcj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410091406.PM7WcKcj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/ibmasm/lowlevel.c:35:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *to @@     got struct i2o_header * @@
   drivers/misc/ibmasm/lowlevel.c:35:22: sparse:     expected void volatile [noderef] __iomem *to
   drivers/misc/ibmasm/lowlevel.c:35:22: sparse:     got struct i2o_header *
>> drivers/misc/ibmasm/lowlevel.c:36:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *to @@     got void ** @@
   drivers/misc/ibmasm/lowlevel.c:36:22: sparse:     expected void volatile [noderef] __iomem *to
   drivers/misc/ibmasm/lowlevel.c:36:22: sparse:     got void **
   drivers/misc/ibmasm/lowlevel.c: note: in included file:
   drivers/misc/ibmasm/lowlevel.h:120:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/misc/ibmasm/lowlevel.h:120:17: sparse: sparse: cast removes address space '__iomem' of expression
--
>> drivers/misc/ibmasm/heartbeat.c:85:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *from @@     got void *message @@
   drivers/misc/ibmasm/heartbeat.c:85:36: sparse:     expected void const volatile [noderef] __iomem *from
   drivers/misc/ibmasm/heartbeat.c:85:36: sparse:     got void *message
--
>> drivers/misc/ibmasm/event.c:54:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *from @@     got void *data @@
   drivers/misc/ibmasm/event.c:54:36: sparse:     expected void const volatile [noderef] __iomem *from
   drivers/misc/ibmasm/event.c:54:36: sparse:     got void *data
--
   drivers/misc/ibmasm/remote.c:180:39: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/misc/ibmasm/remote.c:180:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *from @@     got void * @@
   drivers/misc/ibmasm/remote.c:180:39: sparse:     expected void const volatile [noderef] __iomem *from
   drivers/misc/ibmasm/remote.c:180:39: sparse:     got void *
--
>> drivers/misc/ibmasm/command.c:168:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *from @@     got void *response @@
   drivers/misc/ibmasm/command.c:168:36: sparse:     expected void const volatile [noderef] __iomem *from
   drivers/misc/ibmasm/command.c:168:36: sparse:     got void *response

vim +35 drivers/misc/ibmasm/lowlevel.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  17  
^1da177e4c3f41 Linus Torvalds 2005-04-16  18  
^1da177e4c3f41 Linus Torvalds 2005-04-16  19  int ibmasm_send_i2o_message(struct service_processor *sp)
^1da177e4c3f41 Linus Torvalds 2005-04-16  20  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  21  	u32 mfa;
^1da177e4c3f41 Linus Torvalds 2005-04-16  22  	unsigned int command_size;
^1da177e4c3f41 Linus Torvalds 2005-04-16  23  	struct i2o_message *message;
^1da177e4c3f41 Linus Torvalds 2005-04-16  24  	struct command *command = sp->current_command;
^1da177e4c3f41 Linus Torvalds 2005-04-16  25  
^1da177e4c3f41 Linus Torvalds 2005-04-16  26  	mfa = get_mfa_inbound(sp->base_address);
^1da177e4c3f41 Linus Torvalds 2005-04-16  27  	if (!mfa)
^1da177e4c3f41 Linus Torvalds 2005-04-16  28  		return 1;
^1da177e4c3f41 Linus Torvalds 2005-04-16  29  
^1da177e4c3f41 Linus Torvalds 2005-04-16  30  	command_size = get_dot_command_size(command->buffer);
^1da177e4c3f41 Linus Torvalds 2005-04-16  31  	header.message_size = outgoing_message_size(command_size);
^1da177e4c3f41 Linus Torvalds 2005-04-16  32  
^1da177e4c3f41 Linus Torvalds 2005-04-16  33  	message = get_i2o_message(sp->base_address, mfa);
^1da177e4c3f41 Linus Torvalds 2005-04-16  34  
278d72ae8803ff Max Asbock     2005-06-21 @35  	memcpy_toio(&message->header, &header, sizeof(struct i2o_header));
278d72ae8803ff Max Asbock     2005-06-21 @36  	memcpy_toio(&message->data, command->buffer, command_size);
^1da177e4c3f41 Linus Torvalds 2005-04-16  37  
^1da177e4c3f41 Linus Torvalds 2005-04-16  38  	set_mfa_inbound(sp->base_address, mfa);
^1da177e4c3f41 Linus Torvalds 2005-04-16  39  
^1da177e4c3f41 Linus Torvalds 2005-04-16  40  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  41  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  42  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
