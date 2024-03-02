Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567D72C697
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 18:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709402965; cv=none; b=XVNeQIBKtWb2OKcLX4Q07H6IhL/hDEsWAvm+JgL8ASHoiHewKi27fDPGDn8ssDGIjPSSE003LI87W8zH2dxnpac4hdCfap99YBldYiEzQvka1N/Q2NOTTn+nqtLqVcM/aleJd1rt32KkJr9MVs7UZZx38gD8u74bg2UQoBicXF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709402965; c=relaxed/simple;
	bh=FU/QoHhtyAxcZ4mjSjKgf0gjq7NkU2ZbECBmB3zef5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q89ilYbItoi5p2CBWpu3W+08X2BLVSqG44FMYwBsm3RejwTCZqi9RAG13etibJlGCGrYUqYxkGL3QSuL2CRh9g9QQElUtvb/NdqMovNkjHC57cgORnn0AzgCPH4R+yVxFhPZyxRUS+jb/DmwBuRWd3ygx+uwZwI6BTr45KXZcTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p9Ssb6+q; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p9Ssb6+q"
Message-ID: <ef878388-ecef-45ff-a33a-d7b2e18d5220@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709402960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bgPk+rTxpwWNQqzbhXb+NEtPGoKxdfgxofmyHTrXzyo=;
	b=p9Ssb6+q75aDDRXy/EedCObSwLFirqYarxxnaXMkGnv+UYPAuaFmxAizFSvnsOPhHPH2Q9
	3kgMaIKSZBZiSUP7inPqcNWIf5dA0Z+AQ6bJFk5NiKngw2focF1iCH6rMJhaDyY6A2XOis
	EgGtHPhjhPfIfG1nvZBJm36yGMkeSck=
Date: Sat, 2 Mar 2024 10:09:12 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [linux-next:master 5519/11156]
 kernel/bpf/bpf_struct_ops.c:247:16: warning: bitwise operation between
 different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type')
Content-Language: en-GB
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Kui-Feng Lee <sinquersw@gmail.com>
Cc: Thinker Li <thinker.li@gmail.com>, kernel test robot <lkp@intel.com>,
 oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Martin KaFai Lau <martin.lau@kernel.org>, bpf <bpf@vger.kernel.org>
References: <202403010423.0vNdUDBW-lkp@intel.com>
 <CAFVMQ6QYvHfc_=cpOddWgoWDTRt3GHG5+LLB3NoFFRRiCMWDLw@mail.gmail.com>
 <73e0fa99-7dff-4cb9-bfed-fd3368e54542@gmail.com>
 <CAADnVQJUZZXusOS3h9fnUUoFQ7=o5iJDDANaUqNBheuhHrUXeg@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <CAADnVQJUZZXusOS3h9fnUUoFQ7=o5iJDDANaUqNBheuhHrUXeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 3/1/24 10:27 AM, Alexei Starovoitov wrote:
> On Fri, Mar 1, 2024 at 10:26 AM Kui-Feng Lee <sinquersw@gmail.com> wrote:
>> For BPF,
>>
>> We have a lot of code mixing bpf_type_flag and bpf_reg_type in bpf.
>> They cause the warning messages described in the message following.
>> Do we want to fix them all, or keep them as they are?
>>
>> They can be fixed by merging two enum types or casting here and there if
>> we want. Any other idea?
> We probably should add -Wno-enum-enum-conversion to kernel/bpf/Makefile instead.

The warnings are only triggered with latest llvm19 development branch.
The warnings are triggered in many subsystems, bpf, mm, etc.
The following commandline can workaround the issue:
    make LLVM=1 -j KCFLAGS=-Wno-enum-enum-conversion
There is a discussion how to fix it here:
   https://github.com/ClangBuiltLinux/linux/issues/2002
No conclusion yet.

