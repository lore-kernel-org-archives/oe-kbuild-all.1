Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AD03D994
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 23:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744932986; cv=none; b=ZcM7LB8Wd0vjtZkZ/b3hpMlV4+KGV2gAoTqAyhIWJfZ4ZS2lYZKBQhi8sq6Vtco6Inpz5OfBD6500Yb0vdi+nLLoV4jQLax5UaiEtrZygR1k8qFXHy8lATAj2fCBNZ7ON8I9H/sozdZS1lkD4yLLXFKUyvYWFYIGc2AAdB4hrQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744932986; c=relaxed/simple;
	bh=PbZc+ltmFCtobjop3nPO3WC1tT6Bqv0+pNI/ptnp4u0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=onGoVPIbki2xTc3/o7a2CVWODQry3D5Hbmz0vuUYI7yyBxQ92fqVmYkHL9ByyUgVUnXvBWt0TZ313FIyGBfZmG04bIHRrueYtlme+xBJA0P7GC49cN8aB6auJiaxIfEoDEJMocF7yuSHFUO5oycflmC500WszA+8Q3J38AOZiS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gYbaENDW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gYbaENDW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FC9C4CEE4;
	Thu, 17 Apr 2025 23:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744932986;
	bh=PbZc+ltmFCtobjop3nPO3WC1tT6Bqv0+pNI/ptnp4u0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gYbaENDWAngNTrH1KzygqNmqBMivSl5dL+uDl3M+FQySgxfDTpd/D0qRl3sAoYw0I
	 QKzLifhhQYDAJu18lHwjru/zKK4PB2Gz7U6g8cJoTHZZFm3oF7CzpCXnQfVAqsUWbc
	 MpUy/C9rKGb9veZkeF1wxuOagv5tXxHCixND8gcU=
Date: Thu, 17 Apr 2025 16:36:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Yuquan Wang <wangyuquan1236@phytium.com.cn>,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [linux-next:master 3890/4528] drivers/acpi/numa/srat.c:467:13:
 error: implicit declaration of function 'numa_add_reserved_memblk'
Message-Id: <20250417163625.e0ea4844a19e391618211aa3@linux-foundation.org>
In-Reply-To: <202504180647.e3VdYsTZ-lkp@intel.com>
References: <202504180647.e3VdYsTZ-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Apr 2025 06:41:34 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   bc8aa6cdadcc00862f2b5720e5de2e17f696a081
> commit: 8579eee90756b972a13ef678848c49eabb99f3b6 [3890/4528] mm: numa_memblks: introduce numa_add_reserved_memblk()
> config: loongarch-randconfig-001-20250418 (https://download.01.org/0day-ci/archive/20250418/202504180647.e3VdYsTZ-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504180647.e3VdYsTZ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504180647.e3VdYsTZ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/acpi/numa/srat.c: In function 'acpi_parse_cfmws':
> >> drivers/acpi/numa/srat.c:467:13: error: implicit declaration of function 'numa_add_reserved_memblk' [-Wimplicit-function-declaration]
>      467 |         if (numa_add_reserved_memblk(node, start, end) < 0) {
>          |             ^~~~~~~~~~~~~~~~~~~~~~~~

OK, thanks, also https://lkml.kernel.org/r/CANiq72mHkzLMZj=tBtMqq6N_uvt9AAtShXyVPq5rA3xaFWguMA@mail.gmail.com

I'll drop this version of the patch.
