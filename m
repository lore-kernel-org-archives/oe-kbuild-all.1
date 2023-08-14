Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3086C2C9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 15:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692027505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ftfZzPPxMX01Gby0U/PiwMfwiI0XDF12P1Ajb3ohqCY=;
	b=WSYD0135S4hEGEtfMJ62DYaa8tDKiPT23kAdz1jIttYWO4fyXApHTS+U+h90dJVjOPa6HB
	Rb48294r1OXACu6jHnQcO0m8b4U7LjR4XDuyip/ZV1qI5ymMTzALI6LI8bC2rnB/lTt5Tb
	FvsLX7Edxk1637kAMh7Aiw6OJEgRE2w=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-KxxDnaFoOfyEAYhxsif-mg-1; Mon, 14 Aug 2023 11:38:24 -0400
X-MC-Unique: KxxDnaFoOfyEAYhxsif-mg-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-645778904dfso8256106d6.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 08:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692027503; x=1692632303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftfZzPPxMX01Gby0U/PiwMfwiI0XDF12P1Ajb3ohqCY=;
        b=EGwahd96sQbZzO6di9HNNQJfpXLuUAiNgeNS2RF+kPhfSlOFFLzp8xDWuc/JaFebhw
         xWKKZ3cBP15tYtNI4Ub+kwkuH0FKyKzKVICGjY49KbTIEOR/COM1BaQzcrlSY0HL5jWh
         f8EWgV/EQIMV/Z4jLxjTgc7y+w/WYhOl+zPKgXtx1/Ex4OkIZ6SgKiNWIMSTuiW5R4YJ
         1Kv6xZADyjz0Xz/vJBdXnhPph1HvPZLBFxAo8fVatYE0yiRcOb3ZXlq5RIcVGe/mfAEk
         QT8UVD9Eay5WthvpXnzdCtwPHY2MFFtSUWxAX8aO6h6I3X8EpLhK4RDVWqn0WEtJYa8m
         XhyA==
X-Gm-Message-State: AOJu0YwpWDZKN+lKPE+hRzlKhqFMdCgZTa8JEIn3Ai8xwIA4Oz5mXyB2
	/piQwsJcamJ9G5I/rLEcxdBkZyAQsJef3+Ejxpe8QztqX5wJrVLFc3JYS3BTAaWOXu+GmkDISqh
	Ws67M59QCMNjfrIWkGPHcvPGJLw==
X-Received: by 2002:ad4:5f0f:0:b0:625:aa48:e50f with SMTP id fo15-20020ad45f0f000000b00625aa48e50fmr13929600qvb.6.1692027503761;
        Mon, 14 Aug 2023 08:38:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFACOs0OhCKoORZlOJko4R2FENW1W6OqTr5H/q9L0Y8dHpVVK+fY2mYrwhhPkkNvUWN04cF0w==
X-Received: by 2002:ad4:5f0f:0:b0:625:aa48:e50f with SMTP id fo15-20020ad45f0f000000b00625aa48e50fmr13929579qvb.6.1692027503460;
        Mon, 14 Aug 2023 08:38:23 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com. [99.254.144.39])
        by smtp.gmail.com with ESMTPSA id pc5-20020a05620a840500b00767fbfea21dsm3098480qkn.69.2023.08.14.08.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 08:38:22 -0700 (PDT)
Date: Mon, 14 Aug 2023 11:38:18 -0400
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Huang, Ying" <ying.huang@intel.com>
Subject: Re: Cannot find symbol for section 69: .text.arch_max_swapfile_size.
Message-ID: <ZNpKaiweCbf9i5QS@x1n>
References: <202308120906.Efohswpa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202308120906.Efohswpa-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Aug 12, 2023 at 09:11:33AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   190bf7b14b0cf3df19c059061be032bd8994a597
> commit: be45a4902c7caa717fee6b2f671e59b396ed395c mm/swap: cache maximum swapfile size when init swap
> date:   11 months ago
> config: mips-randconfig-r014-20230811 (https://download.01.org/0day-ci/archive/20230812/202308120906.Efohswpa-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120906.Efohswpa-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308120906.Efohswpa-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> Cannot find symbol for section 69: .text.arch_max_swapfile_size.
>    mm/swapfile.o: failed

Hmm.. I don't really know what's the issue here, neither can I reproduce
this locally - the cross build seems to all work with the reproducer and I
can see mm/swapfile.o correctly generated.

$ wget https://download.01.org/0day-ci/archive/20230812/202308120906.Efohswpa-lkp@intel.com/config
$ mv config .config
$ COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ./make.cross W=1 O=build_dir ARCH=mips olddefconfig
[...]
$ COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ./make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash
[...]
FIT description: Linux 6.5.0-rc4-00492-gad3232df3e41
Created:         Mon Aug 14 11:35:57 2023
 Image 0 (kernel)
  Description:  Linux 6.5.0-rc4-00492-gad3232df3e41
  Created:      Mon Aug 14 11:35:57 2023
  Type:         Kernel Image
  Compression:  gzip compressed
  Data Size:    1767982 Bytes = 1726.54 KiB = 1.69 MiB
  Architecture: MIPS
  OS:           Linux
  Load Address: 0x80100000
  Entry Point:  0x8043e5f0
  Hash algo:    sha1
  Hash value:   750e28c2fdd0d73eec9b0d8dbf5655579cb1364c
 Default Configuration: 'conf-default'
 Configuration 0 (conf-default)
  Description:  Generic Linux kernel
  Kernel:       kernel
$ file build_dir/mm/swapfile.o 
build_dir/mm/swapfile.o: ELF 32-bit MSB relocatable, MIPS, MIPS32 version 1 (SYSV), not stripped

Please let me now if anyone knows what I'm missing.

-- 
Peter Xu

