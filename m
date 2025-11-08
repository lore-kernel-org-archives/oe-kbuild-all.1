Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BEF1C6FE1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762620189; cv=none; b=M4iMsb4i0YXuQnyK1X4XpKqD4jdIXGAk8c3nldw3xl052I21ulE+BCvYk9utbRGX8GXJ2R4YKZpTKZ0Iv8DpcgQIoqcRZoc1navSdxFRakqtzjXN8YiDrCRWH0f++koAboldUEptZV4vDmVCTvPutGLLeYDlGbPwlAOOhNlwj+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762620189; c=relaxed/simple;
	bh=XUVkFx72QpXYBR1BpK+jTHmcdZIEAoxO4YDddfxFpMY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NvSjObR/yevG2Uf4zRMUIA7jayR7V1QyeIC5nfUmsP+FtQ3Sp3UHX0NRT147W74BUx+J/P7IwYyhW0DVAmRhoxqDvX6AFbRjpx4X7shz6pvgINBwPWLUaQ02L1312jkG9lWJyHnDYL+lbN2dyaZNaZpPUFmJMUCAEFK0unyupQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=drWTCoHz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="drWTCoHz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3BAC113D0;
	Sat,  8 Nov 2025 16:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1762620189;
	bh=XUVkFx72QpXYBR1BpK+jTHmcdZIEAoxO4YDddfxFpMY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=drWTCoHzvWrk72zxaF48gJSVEjnyYzFUvrTo1GaG3Q6NN7yaqI4C78yjSoPXOQBg9
	 kWhefy+AmNTp62/XiR037JnE/y85bO6+7oh6GO1mfy1w33ZiuknwaVCl46qpzjBRZC
	 aZz0/iNBNGOjvzF+QBmd3na67bMzcfGJgDL6vbek=
Date: Sat, 8 Nov 2025 08:43:08 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Pratyush Yadav <ptyadav@amazon.de>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, Pasha Tatashin
 <pasha.tatashin@soleen.com>
Subject: Re: [akpm-mm:mm-nonmm-unstable 129/139] mm/shmem.c:5811:23:
 warning: unused variable 'flags'
Message-Id: <20251108084308.8640699dc4f737c520841391@linux-foundation.org>
In-Reply-To: <202511081101.9sXNBrzT-lkp@intel.com>
References: <202511081101.9sXNBrzT-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 8 Nov 2025 11:51:06 +0800 kernel test robot <lkp@intel.com> wrote:

> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   2fa523fd0829356881811ce9553b707102f55bd3
> commit: 730fb8720d1ba209cd74692ece9766101e1fdb56 [129/139] mm: shmem: use SHMEM_F_* flags instead of VM_* flags
> config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251108/202511081101.9sXNBrzT-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511081101.9sXNBrzT-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511081101.9sXNBrzT-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    mm/shmem.c: In function '__shmem_file_setup':
> >> mm/shmem.c:5811:23: warning: unused variable 'flags' [-Wunused-variable]
>     5811 |         unsigned long flags = (vm_flags & VM_NORESERVE) ? SHMEM_F_NORESERVE : 0;
>          |                       ^~~~~

Yeah, thanks, that's reason #47 for using C instead of CPP.

--- a/mm/shmem.c~mm-shmem-use-shmem_f_-flags-instead-of-vm_-flags-fix
+++ a/mm/shmem.c
@@ -5818,8 +5818,15 @@ EXPORT_SYMBOL_GPL(shmem_truncate_range);
 #define shmem_vm_ops				generic_file_vm_ops
 #define shmem_anon_vm_ops			generic_file_vm_ops
 #define shmem_file_operations			ramfs_file_operations
-#define shmem_acct_size(flags, size)		0
-#define shmem_unacct_size(flags, size)		do {} while (0)
+
+static inline int shmem_acct_size(unsigned long flags, loff_t size)
+{
+	return 0;
+}
+
+static inline void shmem_unacct_size(unsigned long flags, loff_t size)
+{
+}
 
 static inline struct inode *shmem_get_inode(struct mnt_idmap *idmap,
 				struct super_block *sb, struct inode *dir,
_

