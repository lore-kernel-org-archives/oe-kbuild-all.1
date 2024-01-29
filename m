Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB83A2E415
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 14:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706539440; cv=none; b=QV4LdOZb2PkHzFMdj+iCrY5+c0nmFN9EsTlx+8CY7avn8WWAB+YwTGtx57vwdgHrURnhH5BtF1RKYQI9Sv5fuv/tEoQlttojTS0n9h1ff8xNBK09SmW9CLN3e08oKdqhBelDmSIdw7ANrZm7GQYygRJWJo0mkxyzAL3q+7c5PmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706539440; c=relaxed/simple;
	bh=EQ4CL9OjQ8T2FGEVP2966EYgVJdXZFVLN6VWAoh5f4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ojvjFdJIQUuaelsxFUXQprZ5FKhb9WI8bA/oVAJIeBhzInPZenxBcGXG4D3Oeyd5nZ275aIsRbkrAHh7MkQzVb1L+INHqbOvh+DrQtejSsJoVskVP4/9q322WGnSEb8rXTMBNrSGQtx2nFSDnDtqBgM4+m6QcQ9lPEOKZyfMYFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fmBrF+ch; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fmBrF+ch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706539437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/E+VdQK8HeRV8zFnLJ77/VNXYvfZcEE8+HNO+APYekw=;
	b=fmBrF+chRPtXsSj/oaGcwJL2qwOaBfvn50JMpBq4HITQovmtvKHzkYc0FYpAyGn0lQA+5j
	kpRrhcYdiJqzEpszQ0KXzGRSgAJ8ldJjnnnW+MZyD5PtvY0vOFNetqXu2rqu4NcMkzOPDJ
	UWRwA9F2scAS8tEHBbgwbDF3VS/Jw78=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-GyBMoOu2MHO8DVzoblgGWg-1; Mon, 29 Jan 2024 09:43:54 -0500
X-MC-Unique: GyBMoOu2MHO8DVzoblgGWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2573D8493EB;
	Mon, 29 Jan 2024 14:43:54 +0000 (UTC)
Received: from localhost (unknown [10.72.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68F471121306;
	Mon, 29 Jan 2024 14:43:53 +0000 (UTC)
Date: Mon, 29 Jan 2024 22:43:50 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 1576/1892] s390-linux-ld:
 drivers/of/kexec.c:399:undefined reference to `crashk_res'
Message-ID: <Zbe5pszGN9AgBOgM@MiWiFi-R3L-srv>
References: <202401291400.2iU26ixw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202401291400.2iU26ixw-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 01/29/24 at 02:37pm, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   596764183be8ebb13352b281a442a1f1151c9b06
> commit: ad82e944d12ca472df041acb4c732bd630a81b90 [1576/1892] s390, crash: wrap crash dumping code into crash related ifdefs
> config: s390-randconfig-r023-20230616 (https://download.01.org/0day-ci/archive/20240129/202401291400.2iU26ixw-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401291400.2iU26ixw-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401291400.2iU26ixw-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    s390-linux-ld: arch/s390/kernel/machine_kexec.o: in function `arch_crash_save_vmcoreinfo':
>    arch/s390/kernel/machine_kexec.c:216:(.text+0x1c0): undefined reference to `vmcoreinfo_append_str'
>    s390-linux-ld: arch/s390/kernel/machine_kexec.c:217:(.text+0x1d8): undefined reference to `vmcoreinfo_append_str'
>    s390-linux-ld: arch/s390/kernel/machine_kexec.c:218:(.text+0x1ee): undefined reference to `vmcoreinfo_append_str'
>    s390-linux-ld: arch/s390/kernel/machine_kexec.c:219:(.text+0x206): undefined reference to `vmcoreinfo_append_str'
>    s390-linux-ld: arch/s390/kernel/machine_kexec.c:220:(.text+0x21e): undefined reference to `vmcoreinfo_append_str'
>    s390-linux-ld: arch/s390/kernel/machine_kexec.o:arch/s390/kernel/machine_kexec.c:221: more undefined references to `vmcoreinfo_append_str' follow
>    s390-linux-ld: arch/s390/kernel/machine_kexec.o: in function `arch_crash_save_vmcoreinfo':
>    arch/s390/kernel/machine_kexec.c:223:(.text+0x254): undefined reference to `paddr_vmcoreinfo_note'

Thanks for reporting these. These errors has been reported by Nathan.

Above error is fixed in below patch:

[PATCH linux-next 3/3] arch, crash: move arch_crash_save_vmcoreinfo() out to file vmcore_info.c
https://lore.kernel.org/all/20240129135033.157195-3-bhe@redhat.com/T/#u


>    s390-linux-ld: drivers/of/kexec.o: in function `of_kexec_alloc_and_setup_fdt':
>    drivers/of/kexec.c:399:(.text+0x922): undefined reference to `crashk_res'
> >> s390-linux-ld: drivers/of/kexec.c:399:(.text+0x944): undefined reference to `crashk_res'
>    s390-linux-ld: drivers/of/kexec.c:401:(.text+0x970): undefined reference to `crashk_res'
>    s390-linux-ld: drivers/of/kexec.c:405:(.text+0x9aa): undefined reference to `crashk_low_res'
>    s390-linux-ld: drivers/of/kexec.c:405:(.text+0x9d0): undefined reference to `crashk_low_res'
>    s390-linux-ld: drivers/of/kexec.c:406:(.text+0x9fc): undefined reference to `crashk_low_res'

Above error is fixed in 

[PATCH linux-next 2/3] crash: fix building error in generic codes
https://lore.kernel.org/all/20240129135033.157195-2-bhe@redhat.com/T/#u

