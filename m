Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C279A5234
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 22:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714862706; cv=none; b=KqH+Y5dFj7NH3BtOgkeWYIquxsUVhrw4q9dp5yNw84+K4OkWbXi5F+LcBnbpMdLvnWcX835jbKNiPmcURodHIwLLetpIjc1AS+VIiOKv6n1T7UEW1EvvA1GoB5KdydpII33t/wDLhwVhuSG9j4szYSZ7oPolLIPy9JmfTVDZUVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714862706; c=relaxed/simple;
	bh=wIkMy/aIJUZBRpBNzcCyh4rgL2cxKhChqFeer1+RwGU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Z6IUNZtvXFoff8iiPRs+HqKouDUqE5u2eALhSzScwc+JLG4vYTjBKdXheiRDFBfec0GtSIGq/Vr8GN/vT4hkWBZ8fWBL9n+O4rEZYj44HIZZYxDWgQOfwF2KKHMQ9QUdKmlepbCFYpIADhQLmhnOdE3u5UVUOnpo8DRMfaUzAxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Lut5JK1m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Lut5JK1m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08E1C072AA;
	Sat,  4 May 2024 22:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1714862706;
	bh=wIkMy/aIJUZBRpBNzcCyh4rgL2cxKhChqFeer1+RwGU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Lut5JK1mupwsPRhGO6YIdDjdnC/b8kg8ZJHfNpEYdeMWEDjOGYkaB44BbwsZe3H/H
	 BEP0wrBqyFjQiavapKFEMa21bB9MGwkKEEXOGnnBwGPUGWwJFQNa7gYA3RSfqh06LD
	 HinbaoRQkB9F3EnfFbRQ+hSnk9JXgcCDmkFSuL48=
Date: Sat, 4 May 2024 15:44:55 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Song Liu <song@kernel.org>, oe-kbuild-all@lists.linux.dev, Linux Memory
 Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-nonmm-unstable 80/82] kernel/watchdog_perf.c:282:
 warning: Function parameter or struct member 'str' not described in
 'hardlockup_config_perf_event'
Message-Id: <20240504154455.2ddd2cbc523698a270cca9c2@linux-foundation.org>
In-Reply-To: <202405040851.2EgypmL1-lkp@intel.com>
References: <202405040851.2EgypmL1-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 4 May 2024 08:38:45 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   2ce87845f9106e693ba6d72cc95af6c86dc52d98
> commit: 96dca662f6d64b4d31ad186ea1464e9b25d749c3 [80/82] watchdog: allow nmi watchdog to use raw perf event
> config: x86_64-buildonly-randconfig-003-20240504 (https://download.01.org/0day-ci/archive/20240504/202405040851.2EgypmL1-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040851.2EgypmL1-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405040851.2EgypmL1-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/watchdog_perf.c:282: warning: Function parameter or struct member 'str' not described in 'hardlockup_config_perf_event'
> 
> 
> vim +282 kernel/watchdog_perf.c
> 
>    277	
>    278	/**
>    279	 * hardlockup_config_perf_event - Overwrite config of wd_hw_attr.
>    280	 */
>    281	void __init hardlockup_config_perf_event(const char *str)
>  > 282	{

Thanks, how does this look?

--- a/kernel/watchdog_perf.c~watchdog-allow-nmi-watchdog-to-use-raw-perf-event-fix
+++ a/kernel/watchdog_perf.c
@@ -277,6 +277,8 @@ int __init watchdog_hardlockup_probe(voi
 
 /**
  * hardlockup_config_perf_event - Overwrite config of wd_hw_attr.
+ *
+ * @str: number which identifies the raw perf event to use
  */
 void __init hardlockup_config_perf_event(const char *str)
 {
_

