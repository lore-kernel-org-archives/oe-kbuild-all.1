Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702C5394EB0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 14:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787149229; cv=none; b=MfbMmPUPYUMVuw6BMYaWDjIPU5IbKLG2twGjsGLe0DH7MkO9TAcckCToh1tFgEsOTF0hniokI0sRiWBWpdbKgtfasg3T/c/aQ2h32qSfEfX8QOboEfCx8ddmU0IPFAF7nyPCG8XMzWO7GqDYnVhEcyhuwtqQ1wtmJycUxJZ3654=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787149229; c=relaxed/simple;
	bh=HBwA+tyyJBHyKzCXIVkhDt6nMP1otC/pBh3gh9DQw/U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=taW6pHnDaRJVV+xlQ9DyxG6aGiEgqmnvYeKDdryi4ksuUHr3m4g6X51Bj3fUvESPfCjIvOrB8kyGLMb1/cHkvuYbqDLlduUWEm0TsxfP6OlWVMYlqwonBOOsVvaKClVvGj7PhEzl/ZrsB+h+YGTjFqYyoCKn+21rt/F6K/gUa1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9P/s7tt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9P/s7tt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D381F000E9;
	Wed, 19 Aug 2026 14:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787149228;
	bh=3DRpgOrc7sDMZRCqrBSC2ofkUsvjIumdI1NWx5IJmsM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=C9P/s7ttPiuUi0S9SMM5cmQ3b/7hU6YtQlB6ec6Y3HcomUF4morlu0C7ObMuSndVh
	 GSwb2Bvkm4r0Fv9oVS0q92LDKY0Po6fEvStpgBtSHDyursGYJT7xhHhFcT9kWOoCgV
	 IKvmX6LN/rt/CpKoM5leu0SJLbON9dzPV4t9hd27tBNnLXYYWEpKfhwXlGcmUYv8+L
	 N6lr3VYuTBFllMDjY4BjfuzDchj+IWZvOB58uxK+1nDJ8yMGh5c7rw0QEvwxJ6PpS3
	 QLWvaJBQBTV80de23cydFVlLExm6kum6YtvcYTtZe03fYUtg3tFarPBstrLoBhhOL8
	 uijs4PgdTy56A==
Date: Wed, 19 Aug 2026 16:20:25 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: kernel test robot <lkp@intel.com>
cc: Michael Bommarito <michael.bommarito@gmail.com>, 
    oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 10759/15982] ld.lld: error: undefined symbol:
 kunit_mem_assert_format
In-Reply-To: <202608190536.d9qCkWWc-lkp@intel.com>
Message-ID: <52q8853s-5r61-p770-0pq8-770588pq4956@xreary.bet>
References: <202608190536.d9qCkWWc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Aug 2026, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   e6664f2b33db9b6811eb4cec109f06cb2b4f458d
> commit: 83df7b5fa6735b5084ecd296a0f67208650ba497 [10759/15982] HID: hyperv: add KUnit coverage for device info bounds
> config: i386-randconfig-r123-20260818 (https://download.01.org/0day-ci/archive/20260819/202608190536.d9qCkWWc-lkp@intel.com/config)
> compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190536.d9qCkWWc-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608190536.d9qCkWWc-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: undefined symbol: kunit_mem_assert_format
>    >>> referenced by hid-hyperv.c:697 (drivers/hid/hid-hyperv.c:697)
>    >>>               drivers/hid/hid-hyperv.o:(mousevsc_device_info_valid_descriptor) in archive vmlinux.a

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git e6664f2b33db9b6811eb4cec109f06cb2b4f458d

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index aa7fa11a0197..1f294064515c 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1253,7 +1253,7 @@ config HID_HYPERV_MOUSE
 
 config HID_HYPERV_MOUSE_KUNIT_TEST
 	bool "KUnit tests for Hyper-V mouse driver" if !KUNIT_ALL_TESTS
-	depends on KUNIT && HID_HYPERV_MOUSE
+	depends on KUNIT && (HID_HYPERV = KUNIT || KUNIT = y)
 	default KUNIT_ALL_TESTS
 	help
 	  Builds unit tests for the Hyper-V synthetic HID driver.
-- 
Jiri Kosina
SUSE Labs

