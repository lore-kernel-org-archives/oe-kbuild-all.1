Received: from smtpout.efficios.com (smtpout.efficios.com [167.114.26.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0A7612EA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 20:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.114.26.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707857052; cv=none; b=C2m4Z0+AKOHx5eSX06Go5Y1Cvv9PN+4WW7hmhtcT1gHiLVAPmgwNpV59y7nDWonVN2LlKZJtjl3iMz767g7FubZAfj03w+Kt3AdyB08bveN+65sM1cdM6zT5NtnHoVyCjw4ohHQ97TvMheqFFd26V71+GDuepJKKwwNUScnG4v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707857052; c=relaxed/simple;
	bh=yUo9DUCia3ar+m9KYjMGC2jGiaN/K1370cCPMLE9D+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EoOrRBvciMp29q3/mBVCfMiPGa0S3DF31ErMlZWmw7pYmllJmplmBpbgAYo9gbzHTguNDYjKcDyAFOB2ksLL8tCe4dfBYnpyZDflp3BZWeqaShxJpaXTvyIO0kxIBfTtSXBYd4jnI0xZ7vdgBFWIu2gK6ouLABL5jLXZgrAEI04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=n6tQqiQh; arc=none smtp.client-ip=167.114.26.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="n6tQqiQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1707857049;
	bh=yUo9DUCia3ar+m9KYjMGC2jGiaN/K1370cCPMLE9D+g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n6tQqiQhY/iYiGGtSq5QCt963/B9nm5PZBYJU3rj38L9Z/NreOlNA71CXtOcIpcC4
	 D4Q9G+c7BV903n2ROt9GxzWBUkb2SezhGwXt2ukpb8STVQREcuwTGPWcREgYgSK8Vi
	 x73udNIfb75Gv05MHxomb16NoD86LpmWMkleZKOVfcxzySYHMGkEK13GOJ0CTtU5Jb
	 8QYfYxPSjvmEuTOKzi3ujd915YIp+xuQ7Vb7/IDRpuP1UmBNM6SJdA3ZYnxYi4mPKJ
	 r/lQlXN7dqzKefA0xOYb70hPP45UBBBK8loUWnQbdWRl4pB/bEsipLosyvutUopvID
	 v8y3skAAK55bQ==
Received: from [172.16.0.134] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4TZCwn3MQCzYPm;
	Tue, 13 Feb 2024 15:44:09 -0500 (EST)
Message-ID: <5806e90f-a4b2-4f74-9cf6-5fc10a303ba7@efficios.com>
Date: Tue, 13 Feb 2024 15:44:09 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 5601/6082] drivers/md/dm.c:2131:undefined
 reference to `set_dax_nocache'
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 kernel test robot <lkp@intel.com>, Dan Williams <dan.j.williams@intel.com>
References: <202402131351.a0FZOgEG-lkp@intel.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <202402131351.a0FZOgEG-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-13 00:12, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ae00c445390b349e070a64dc62f08aa878db7248
> commit: 9af4599a77df42dba7f32c76a97a19f5703f44b7 [5601/6082] dm: cleanup alloc_dax() error handling
> config: openrisc-randconfig-r011-20221209 (https://download.01.org/0day-ci/archive/20240213/202402131351.a0FZOgEG-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240213/202402131351.a0FZOgEG-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402131351.a0FZOgEG-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     or1k-linux-ld: drivers/md/dm.o: in function `alloc_dev':
>>> drivers/md/dm.c:2131:(.text+0x9f34): undefined reference to `set_dax_nocache'
>>> drivers/md/dm.c:2131:(.text+0x9f34): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `set_dax_nocache'
>>> or1k-linux-ld: drivers/md/dm.c:2132:(.text+0x9f3c): undefined reference to `set_dax_nomc'
>>> drivers/md/dm.c:2132:(.text+0x9f3c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `set_dax_nomc'
>     pahole: .tmp_vmlinux.btf: Invalid argument
>     .btf.vmlinux.bin.o: file not recognized: file format not recognized

It comes as a surprise that a call to set_dax_nocache() from within a
branch provably never taken ends up keeping a reference to the missing
symbol. I would have expected compiler optimizations to remove the call
to the missing symbol altogether, but maybe I'm expecting too much.

Basically here we have:

CONFIG_DAX=n

static inline struct dax_device *alloc_dax(void *private,
                 const struct dax_operations *ops)
{
         return ERR_PTR(-EOPNOTSUPP);
}

static struct mapped_device *alloc_dev(int minor)
{
[...]
         dax_dev = alloc_dax(md, &dm_dax_ops);
         if (IS_ERR(dax_dev)) {
                 if (PTR_ERR(dax_dev) != -EOPNOTSUPP)
                         goto bad;
         } else {
                 set_dax_nocache(dax_dev);
                 set_dax_nomc(dax_dev);
                 md->dax_dev = dax_dev;
                 if (dax_add_host(dax_dev, md->disk))
                         goto bad;
         }

The simple fix would be something like this, but I would like to
understand why we observe this specifically on openrisc and loongarch
(https://lore.kernel.org/oe-kbuild-all/202402140037.wGfA1kqX-lkp@intel.com/).

diff --git a/include/linux/dax.h b/include/linux/dax.h
index df2d52b8a245..9d3e3327af4c 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -63,6 +63,8 @@ void kill_dax(struct dax_device *dax_dev);
  void dax_write_cache(struct dax_device *dax_dev, bool wc);
  bool dax_write_cache_enabled(struct dax_device *dax_dev);
  bool dax_synchronous(struct dax_device *dax_dev);
+void set_dax_nocache(struct dax_device *dax_dev);
+void set_dax_nomc(struct dax_device *dax_dev);
  void set_dax_synchronous(struct dax_device *dax_dev);
  size_t dax_recovery_write(struct dax_device *dax_dev, pgoff_t pgoff,
  		void *addr, size_t bytes, struct iov_iter *i);
@@ -105,6 +107,12 @@ static inline bool dax_synchronous(struct dax_device *dax_dev)
  {
  	return true;
  }
+static inline void set_dax_nocache(struct dax_device *dax_dev)
+{
+}
+static inline void set_dax_nomc(struct dax_device *dax_dev)
+{
+}
  static inline void set_dax_synchronous(struct dax_device *dax_dev)
  {
  }
@@ -120,9 +128,6 @@ static inline size_t dax_recovery_write(struct dax_device *dax_dev,
  }
  #endif
  
-void set_dax_nocache(struct dax_device *dax_dev);
-void set_dax_nomc(struct dax_device *dax_dev);
-
  struct writeback_control;
  #if defined(CONFIG_BLOCK) && defined(CONFIG_FS_DAX)
  int dax_add_host(struct dax_device *dax_dev, struct gendisk *disk);

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

