Received: from mta0.migadu.com (out-32.mta0.migadu.com [91.218.175.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1D23D0903
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 09:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786959603; cv=none; b=shffBNU5P3S7ORHs1RuEKRyyc/UwnLJbEcIBbka4OmJsvK3uREYWn8cVQSb5gNAElm/o4hz8aKqPuNsxv24NClqlxx/lPq/2xWQ2vx8OdQzcIn2Y1z0bWQAPaWOI46d2sF87yfKetqofNWo2PLtL3rTx1nvduHtOP3fXkiK7/1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786959603; c=relaxed/simple;
	bh=RM5++jLcY5umvO/g/TWpla/qxdJ1o8XktB7pekAWUFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yh1/qfqeMmK3WEF/pbOfwll2Y+Ps0SHZ0LQlH+uvrtn8dJzlrZOWXhmYRsY3FzJiJshkr7ZdFpYo6YpehXYFP66PDWCtC+yT3HlGM4awn/VG1GIwo59lNhxHl7YhyirFzqkJlTKj17yXeeUT2j6o+6LAh0ABMBYI5KRpIkqk4W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NcvGOykY; arc=none smtp.client-ip=91.218.175.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NcvGOykY"
X-Envelope-To: oe-kbuild-all@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=RM5++jLcY5umvO/g/TWpla/qxdJ1o8XktB7pekAWUFQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786959595; v=1; x=1787564395;
 b=NcvGOykYM5N1bLkdtCxeB+qrXfJq1LNtivhZbPKqSbjCYFyd/nBTGCdYqJwqqlZAI4NSuUHw
 LY8iT68sQGTl3wToSu/LBY09NOV0zy9VAbgxIkZNP6HdFrjDqbkGLKJXwPPZl1p1IE1I1MypAjP
 vY12dV8Eh/Eb0sPzEGgU667w=
X-Envelope-To: oe-kbuild-all@lists.linux.dev
Received: from [10.54.25.56] (222.72.143.228)
	by smtp.migadu.com with ESMTPS id 548c3e9c82427609;
	Mon, 17 Aug 2026 09:39:55 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <cd082ee1-efde-4cbe-b8f5-00d8aa2d072b@linux.dev>
Date: Mon, 17 Aug 2026 17:39:52 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bpf-next:master 2/5] net/core/bpf_ksock.c:221:18: sparse:
 sparse: symbol 'bpf_ksock_release_dtor' was not declared. Should it be
 static?
To: Mahe Tardy <mahe.tardy@gmail.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
References: <202608171256.McaD8rfl-lkp@intel.com> <aoLTELXtjRC_SEcg@gmail.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <aoLTELXtjRC_SEcg@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/17/26 5:23 PM, Mahe Tardy wrote:
> On Mon, Aug 17, 2026 at 12:36:48PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
>> head:   c93cbdb13f995f87b5356329b3fe551c80bb482d
>> commit: 7ae4eb14c5f9d9bf0e0feabeab206151b1280512 [2/5] bpf: Add ksock kfuncs
>> config: nios2-randconfig-r112-20260817 (https://download.01.org/0day-ci/archive/20260817/202608171256.McaD8rfl-lkp@intel.com/config)
>> compiler: nios2-linux-gcc (GCC) 11.5.0
>> sparse: v0.6.5-rc1
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171256.McaD8rfl-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202608171256.McaD8rfl-lkp@intel.com/
>>
>> sparse warnings: (new ones prefixed by >>)
>>>> net/core/bpf_ksock.c:221:18: sparse: sparse: symbol 'bpf_ksock_release_dtor' was not declared. Should it be static?
> I'll add the 'static', it seems to make sense. I mostly copied this from
> all the others examples with release_dtor functions which don't have
> them but it seems for no good reason.


I think we do not need 'static' actually, just like the doc says


https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/tree/Documentation/bpf/kfuncs.rst#n356


     Note that kfuncs must not be declared ``static``. A kfunc can be 
called from a
     BPF program ``*.c`` file outside the compilation unit that defines 
it, so its
     externally visible name must remain available for BTF ID lookup. 
``static``
     linkage allows the compiler to rename the function, which can break 
this
     BTF-based kfunc resolution. Further note that sparse may warn that 
an otherwise
     unreferenced kfunc should be static. Such warnings should be 
ignored for kfunc
     definitions.




>> vim +/bpf_ksock_release_dtor +221 net/core/bpf_ksock.c
>>
>>     220	
>>   > 221	__bpf_kfunc void bpf_ksock_release_dtor(void *ks)
>>     222	{
>>     223		bpf_ksock_release(ks);
>>     224	}
>>     225	CFI_NOSEAL(bpf_ksock_release_dtor);
>>     226	
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
