Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1B32DCBF8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 08:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.78.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778230588; cv=none; b=c9FI57Y3N06QZQiU/MhP0FihAYivGqyigBZX6SGfYIUUdvilv+tpN1fnxGxeuUkU8+oF+upOhN60j2u/x9ZP310oxBkezAw16J8qWqt8+0Vk1hG3obGgirO4h6sjLd7uYdI2DAQz01a4kO+xPoqUdAMYroEDeoGWm9ZvFB+SNoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778230588; c=relaxed/simple;
	bh=pNVbCNY59mPWx5ujxUM91JZtYr3iah282KOMxuBlqyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFmWGw0U/mcT4hfbLB4/j4kQx+wG0sJfFlcUuONzhQBUyDyYyQa6dJzGOS2snRHau/J/6ikfSQnqXGqBRGbWLSVF7fiLCg8GWdze+rk/y9iGfVrYHq+xHDzlVRzqbG++f4h7WhifGPvBllft/ZzNulGtc4jQUc/dFyVbOnh6LZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.76.78.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrAAXAdYvpf1ppjRFBA--.6834S2;
	Fri, 08 May 2026 16:56:15 +0800 (CST)
Received: from [10.12.170.221] (unknown [10.12.170.221])
	by gateway (Coremail) with SMTP id _____wDX_8Iqpf1pkXNGAA--.40262S2;
	Fri, 08 May 2026 16:56:11 +0800 (CST)
Message-ID: <f2bbe1b2-cbd6-44af-aeab-79850d2f26bd@hust.edu.cn>
Date: Fri, 8 May 2026 16:56:10 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [alexs:docs-next 3/4] htmldocs: Warning:
 Documentation/translations/zh_CN/how-to.rst references a file that doesn't
 exist: Documentation/translations/zh_CN/xxx.rst
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, linux-doc@vger.kernel.org
References: <202605081019.xC04fpcw-lkp@intel.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <202605081019.xC04fpcw-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:HgEQrAAXAdYvpf1ppjRFBA--.6834S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxCw1xZrW3ur4rGry5Gw48WFg_yoW5WFW7pa
	y0kr1xKF1FyF18K3yvgF17Wr1xCa4Iqay7GFyqqwnYqFs0vwnYyw1xKryqqasrtrZ7ZFW5
	XFWIgrW0qry7u37anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm0b7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20x
	vE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07jhTmDUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 5/8/26 4:47 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git docs-next
> head:   962820bece3c1b0b848d0cfd9b9b10002536a736
> commit: abf912ed5d786d4c4c66d8ffae229dc099f139c4 [3/4] docs/zh_CN: restructure how-to.rst patch submission workflow
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260508/202605081019.xC04fpcw-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605081019.xC04fpcw-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>     Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
>     Warning: Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst references a file that doesn't exist: Documentation/filesystems/gfs2-glocks.rst
>     Warning: Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst references a file that doesn't exist: Documentation/filesystems/gfs2-uevents.rst
>     Warning: Documentation/translations/zh_CN/filesystems/gfs2.rst references a file that doesn't exist: Documentation/filesystems/gfs2.rst
>     Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
>>> Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/translations/zh_CN/xxx.rst

These two warnings are false alarms. We use xxx.rst as examples to guide 
kernel newbies.

Dongliang Mu

>     Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
>     Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
>     Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
>     Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>     Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

