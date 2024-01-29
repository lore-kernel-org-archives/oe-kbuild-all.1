Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882971534FB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706540157; cv=none; b=edrsZzI/6u8USsZ/+cIaFRCdWvnL4nxReKXAasL4x9eHWsy0PR/rY/NYkQLbhp8rufP5/y+HY39rYxWo8IuMgJAKJB2On0whLNbK7R07+G3SnS18/WteibjqN323ElZ5pQuqctmEoxtOFR+qth42QEPzVb68ssu8mzKDQkjOBFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706540157; c=relaxed/simple;
	bh=T+n4AyEp0DKBsaHGBR9vBhR7ZFiTHJ9ws4rkHXkXFxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=WiR6VYsXRha9ltx6qs8wwusDOvfYJ5QsCu0ZlnyahyLCwJjHODtRkmTz1TJELJrCHetz/FC2gfOiyMBQAAAyHI/UV0+baRkx0Lw+O8ITYkOXWauUZCU+9aA7N94TyVInA3kfWCr+wLoTW5dhJFaMsw3YgihXuETwJtHHzo3pU9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LEuA9STS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LEuA9STS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706540154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5huqWVBHs7IYwSCzw2YfcXSjBfKGTJfw5R7fGwb0dCw=;
	b=LEuA9STSjmZgJ2YDXkpw/CBjoyUaNKq0KLLYfi9zmLDb52nPXoackYX2RJ/GpiF3qKJ9dB
	+4WezHSV1QeIprfQefRUOopCWh+myTj3+skqrrm5C2BoM5qMMYaP7gXmp9Jb9NSaQ7HkYY
	kJw8wuinbcXx/PCN0ZTNCrSvUjVcBQ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-F9Ij3kN3MdmQ3JgeqUyAzA-1; Mon, 29 Jan 2024 09:55:50 -0500
X-MC-Unique: F9Ij3kN3MdmQ3JgeqUyAzA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F27B83FC22;
	Mon, 29 Jan 2024 14:55:50 +0000 (UTC)
Received: from localhost (unknown [10.72.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95AA41121306;
	Mon, 29 Jan 2024 14:55:49 +0000 (UTC)
Date: Mon, 29 Jan 2024 22:55:35 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 1576/1892] s390-linux-ld: kexec.c:undefined
 reference to `crashk_low_res'
Message-ID: <Zbe8Z/h1oKu/yncB@MiWiFi-R3L-srv>
References: <202401261933.gyy8YHnT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202401261933.gyy8YHnT-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 01/26/24 at 07:45pm, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   01af33cc9894b4489fb68fa35c40e9fe85df63dc
> commit: ad82e944d12ca472df041acb4c732bd630a81b90 [1576/1892] s390, crash: wrap crash dumping code into crash related ifdefs
> config: s390-randconfig-r131-20230823 (https://download.01.org/0day-ci/archive/20240126/202401261933.gyy8YHnT-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401261933.gyy8YHnT-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401261933.gyy8YHnT-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    s390-linux-ld: arch/s390/kernel/machine_kexec.o: in function `arch_crash_save_vmcoreinfo':
>    machine_kexec.c:(.text+0x274): undefined reference to `vmcoreinfo_append_str'
>    s390-linux-ld: machine_kexec.c:(.text+0x28c): undefined reference to `vmcoreinfo_append_str'
>    s390-linux-ld: machine_kexec.c:(.text+0x2a2): undefined reference to `vmcoreinfo_append_str'
>    s390-linux-ld: machine_kexec.c:(.text+0x2c4): undefined reference to `vmcoreinfo_append_str'
>    s390-linux-ld: machine_kexec.c:(.text+0x2e6): undefined reference to `vmcoreinfo_append_str'
>    s390-linux-ld: arch/s390/kernel/machine_kexec.o:machine_kexec.c:(.text+0x308): more undefined references to `vmcoreinfo_append_str' follow
>    s390-linux-ld: arch/s390/kernel/machine_kexec.o: in function `arch_crash_save_vmcoreinfo':
>    machine_kexec.c:(.text+0x340): undefined reference to `paddr_vmcoreinfo_note'
>    s390-linux-ld: drivers/of/kexec.o: in function `of_kexec_alloc_and_setup_fdt':
>    kexec.c:(.text+0x60c): undefined reference to `crashk_res'
> >> s390-linux-ld: kexec.c:(.text+0x660): undefined reference to `crashk_low_res'

Sorry for late response. These have been fixed in below patches.

[PATCH linux-next 3/3] arch, crash: move arch_crash_save_vmcoreinfo() out to file vmcore_info.c
https://lore.kernel.org/all/20240129135033.157195-3-bhe@redhat.com/T/#u

[PATCH linux-next 2/3] crash: fix building error in generic codes
https://lore.kernel.org/all/20240129135033.157195-2-bhe@redhat.com/T/#u

