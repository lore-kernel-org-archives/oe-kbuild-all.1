Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76352226CEB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 03:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753761361; cv=none; b=POfWxtjoUurvaGtSEnw2svCESkbiP1aDleQ/beuvEJAjZjvQXU7EM5AUt8kC1jMfTLaHfs82Hf0bY2icP4yJEhv+sIlN4UVK3se8qBSTYKXHrBd9O3goCDygBbFRE/c3C5As0+lbZzgjPFrBboUTJZJIiAUtQV++V4nOXbkr4tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753761361; c=relaxed/simple;
	bh=85nfbXH4q7adtdcxw9gzdiLUUggxa/SPdpP9fi8iwuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jreAUY42LtekQ6wTyErf5C2WfuTWBxt6SstgMreo3OLsHdw8MhpCDNvx9xLcJA/KGpfX70B0IaXy25iW2DK7y3FTY+pYSWNIr2K0KWAd1SQYrKf82ypvQzVRmQipOobe8Slh5+2X7DdIRe9D93+v1qfzyCfQ/Bwm/BYO+lyipH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ULQlcpYP; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ULQlcpYP"
Message-ID: <ce0c8f01-3b95-44ff-a490-8a91510884c0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753761356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Gnkhd136gazu5+3YgFAjNkCNeFHWLrxJvrNzYEKASg=;
	b=ULQlcpYPcWU0FIW1Bu87CwpBbX8jsi0EebrmuNeiwBWkgUnT2+I1nVs6kksVneeWKRaKee
	TzemFeRRIaOlL61od1WtslRfiLSxS9/mY2lsAY8vDSyb5yc1+EdkP0tNmqdEq5OKVUeMqZ
	XPUJ2ZovUfVQm3FjEzg/DHt5OsKQXYc=
Date: Tue, 29 Jul 2025 11:55:44 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [RFC PATCH bpf-next 1/5] bpf: Extend bpf syscall with common
 attributes support
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <20250728142346.95681-2-leon.hwang@linux.dev>
 <202507291146.0df0CQq9-lkp@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <202507291146.0df0CQq9-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 29/7/25 11:43, kernel test robot wrote:
> Hi Leon,
> 
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on bpf-next/master]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Leon-Hwang/bpf-Extend-bpf-syscall-with-common-attributes-support/20250728-222848
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> patch link:    https://lore.kernel.org/r/20250728142346.95681-2-leon.hwang%40linux.dev
> patch subject: [RFC PATCH bpf-next 1/5] bpf: Extend bpf syscall with common attributes support
> config: arm-randconfig-002-20250729 (https://download.01.org/0day-ci/archive/20250729/202507291146.0df0CQq9-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291146.0df0CQq9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507291146.0df0CQq9-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> kernel/bpf/syscall.c:6140:1: error: conflicting types for 'sys_bpf'
>     6140 | SYSCALL_DEFINE5(bpf, int, cmd, union bpf_attr __user *, uattr, unsigned int, size,
>          | ^
>    include/linux/syscalls.h:228:36: note: expanded from macro 'SYSCALL_DEFINE5'
>      228 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
>          |                                    ^
>    include/linux/syscalls.h:235:2: note: expanded from macro 'SYSCALL_DEFINEx'
>      235 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
>          |         ^
>    include/linux/syscalls.h:249:18: note: expanded from macro '__SYSCALL_DEFINEx'
>      249 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
>          |                         ^
>    <scratch space>:50:1: note: expanded from here
>       50 | sys_bpf
>          | ^
>    include/linux/syscalls.h:929:17: note: previous declaration is here
>      929 | asmlinkage long sys_bpf(int cmd, union bpf_attr __user *attr, unsigned int size);
>          |                 ^
>    1 error generated.
> 

Thanks.

It will be fixed by

diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h


index e5603cc91..3d84faa04 100644


--- a/include/linux/syscalls.h


+++ b/include/linux/syscalls.h


@@ -926,7 +926,8 @@ asmlinkage long sys_seccomp(unsigned int op,
unsigned int flags,

 asmlinkage long sys_getrandom(char __user *buf, size_t count,
                              unsigned int flags);
 asmlinkage long sys_memfd_create(const char __user *uname_ptr, unsigned
int flags);
-asmlinkage long sys_bpf(int cmd, union bpf_attr __user *attr, unsigned
int size);

+asmlinkage long sys_bpf(int cmd, union bpf_attr __user *attr, unsigned
int size,

+                       struct bpf_common_attr __user *attr_common,
unsigned int size_common);

 asmlinkage long sys_execveat(int dfd, const char __user *filename,
                        const char __user *const __user *argv,
                        const char __user *const __user *envp, int flags);

Thanks,
Leon

[...]

