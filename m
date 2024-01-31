Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3EF1272C2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 15:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706715269; cv=none; b=PLmz7W1UDhWW5ZfGsaJ2UmWoCPwdIbfRcVOunwLpkNZE3feJQE8ApysirC9oq6OuDs2RVzuuZcZ1JGLbffS1xMXxA3EQoEztX7vlLBTDxhp3EwWmSfRe7HnJI6NQT/uwqD3Gr6TIcoLQmC1XDwB4LtfROjWWRI55vCRJtG1L+Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706715269; c=relaxed/simple;
	bh=QX9gbvGK6hXWnBBSpXjmdwxEUL2Bg34NOAOlxbZFWm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGDVXPli25+yBQi/xUfjwosxw9lgQ+GE+72f5RAIgN8z0c+9tyl0doynntGaNYjlDvLS+TfEJ7Bs3FcSHJrUe5cj7pevrrUh/4xC45EejIL4uvABhwHhfcjsbSIizncmS/AWwcPNThT9PP3eoH9ZEhN/OeAzinbLOLulf0nYj0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D3/t65Lr; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D3/t65Lr"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a349ed467d9so652106466b.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 07:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706715264; x=1707320064; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ABk8vlRfFlADQTmCiiGTXNNYPhOsPE6AFru6pj0kjwI=;
        b=D3/t65Lr7trZzSmqdIDF3YY9F/OEBCZs5Fep+ZjBqdI1jvF/AzgiONbKlmQVhUqR/A
         Y1dNqIjvLGwkzo630tNkbjU5XUB3hb9xYCS169R5SDq2gGwJKu+iPcipH+aZP3mBOWGA
         jdvx+cn2cptZpxY8r3bIrKphKJlm6XWxUMZfgscgowE3tbfVIb9kbXBefOwpSrgIRkSE
         bui1yPWqzkCvnJ1OUveRN8NVu0ZOkuzM4l/fYto9pMmVNUdRHmuuEMowqfjqloaAC0Sh
         CUQybbNJl18WtRB0ArSDNASmypqkAR9702nxy8fvq6cpEsUOA6S7Suawyma9WW5h7uSJ
         11wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706715264; x=1707320064;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABk8vlRfFlADQTmCiiGTXNNYPhOsPE6AFru6pj0kjwI=;
        b=CNqGN1APZHxm4L2dtCDgZQvJDe61auso5bhm2YyQ6Q993FfA4Fjb7CK4uqYAYHyaGd
         k72COajFVnqBOwwsbMHJq7NbI6yGq6bVVY/NDp6oIQHqpVeQxRIQJv3BPxl9G3RQXjJg
         jVSrDyK65U/amhv0hFlKa4ZIgd85gXmVrLgKjQ0YOoKG+W/c6hRoQYUJhioNrnSk0xC7
         Jd5FJUASAZA48ybacA+GSKhZVaxHYf7tpdfijpA3fp41R9wQHXj7WHIA2sq3OAB8l2il
         eyl6tnNn43MjD8A3i4rR3/smMo6ULnCTcRlZ0CnnOA4Ojkt/G7aHSOvs+9siTdjhsKtT
         e7BQ==
X-Gm-Message-State: AOJu0YwcxiDjee4jKSF+n970kD58TSSPWA/AT0rt5JksTn2+C0fVL6dR
	chB69AvV3ydVYpvDcAnXHQb5KHberWtWO0Iz65cp2oBU+oLtqo1RcpHdmzsXXlo=
X-Google-Smtp-Source: AGHT+IEbth+XXdu0EsBGWxU1fBUxBHHvJXPY6n+YW4dCJhyP6fbLWRseyWdQkKV83AFzMvf6lbS+MQ==
X-Received: by 2002:a17:906:260d:b0:a34:ba53:f582 with SMTP id h13-20020a170906260d00b00a34ba53f582mr1342688ejc.20.1706715264250;
        Wed, 31 Jan 2024 07:34:24 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU7pbVgnq/I+jolWeEpDRK4kB6cr7X+ZtImRtYvvLY0ukL4bue/UiDboIdBhSzoSs89wJI4FkQPWTNxNABG1+v67T91LtsIOiinYKAacUugN00TNYxDh24F0TIqHV4HJj/iYJ+QJprP62cRxfqCJtCNAFr0/OJjfgkCHcvHT9FkXIGkmJdM4fnnY0L5VN62KZSkfwFh5g==
Received: from alley ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id hu19-20020a170907a09300b00a31c5caa750sm5499593ejc.177.2024.01.31.07.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 07:34:24 -0800 (PST)
Date: Wed, 31 Jan 2024 16:34:22 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [linux-next:master 1016/2825] make[2]: ***
 kselftest/livepatch/test_modules: No such file or directory.  Stop.
Message-ID: <ZbpnBqHUl3pE_3Te@alley>
References: <202401300736.GkSZoSrA-lkp@intel.com>
 <ed54875555c282ad3b09503020a7aa978a80bd60.camel@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed54875555c282ad3b09503020a7aa978a80bd60.camel@suse.com>

On Tue 2024-01-30 11:39:56, Marcos Paulo de Souza wrote:
> On Tue, 2024-01-30 at 07:08 +0800, kernel test robot wrote:
> > tree:  
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git m
> > aster
> > head:   596764183be8ebb13352b281a442a1f1151c9b06
> > commit: c4bbe83d27c2446a033cc0381c3fb6be5e8c41c7 [1016/2825]
> > livepatch: Move tests from lib/livepatch to selftests/livepatch
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build):
> > (https://download.01.org/0day-ci/archive/20240130/202401300736.GkSZoS
> > rA-lkp@intel.com/reproduce)
> > 
> When looking at the lib.mk, I just followed the other variables and did
> the same:
> 
> TEST_GEN_MODS_DIR := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_MODS_DIR))
> 
> But later on, I jump into $(TEST_GEN_MODS_DIR), which is invalid
> because of the O= that is used a prefix for the path:
> /tmp/kselftest/kselftest/livepatch/test_modules. My first idea was to
> just remove the patsubst and take TEST_GEN_MODS_DIR, which should be
> livepatch/test_modules in this case, but it then returns another
> problem:
> 
> 
> make: Entering directory
> '/home/mpdesouza/git/linux/tools/testing/selftests'
> make[1]: Entering directory
> '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
> make -C test_modules
> make[2]: Entering directory
> '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modul
> 
> es'
> make -C /lib/modules/6.5.9-1-default/build modules
> KBUILD_EXTMOD=/home/mpdesouza/git/linux/tools/testing/selftests/livepat
> 
> ch/test_modules

Nit: There are sometimes strange empty lines between split long
     lines. It looks like somehow messed cut&paste.

> make[3]: Entering directory '/usr/src/linux-6.5.9-1-obj/x86_64/default'
> make[4]: Entering directory '/tmp/kselftest'
> /usr/src/linux-6.5.9-1/Makefile:754: include/config/auto.conf: No such
> file or directory

I see the same. It looks to me like a bug in kernel-devel package.

/usr/src/linux-6.5.9-1/Makefile is from the kernel-devel package
for the running kernel. It should try to include auto.conf used
for building the running kernel:

  1. auto.conf should be packaged in kernel-devel.

  2. The Makefile from the kernel-devel packages should be able
     to find/use auto.conf from the kernel-devel package.

IMHO, this actually helped to find a bug that
make -C tools/testing/selftests/livepatch used auto.conf from
the git tree while the modules are built against headers
for the running kernel.

That said, I wonder why this problem does not happen when building
external modules (KMPs). I would expect that they are using
the same Makefile from the kernel-devel package.

Maybe the external modules somehow manage to clear "need-config"
used by /usr/src/linux-6.5.9-1/Makefile. Maybe we do not need
to include it either.

> make[4]: *** [/usr/src/linux-6.5.9-1/Makefile:234: __sub-make] Error 2
> make[4]: Leaving directory '/tmp/kselftest'
> make[3]: *** [../../../linux-6.5.9-1/Makefile:234: __sub-make] Error 2
> make[3]: Leaving directory '/usr/src/linux-6.5.9-1-obj/x86_64/default'
> make[2]: *** [Makefile:16: modules] Error 2
> make[2]: Leaving directory
> '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modul
> 
> es'
> make[1]: *** [../lib.mk:92: gen_mods_dir] Error 2
> make[1]: Leaving directory
> '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
> make: *** [Makefile:180: all] Error 2
> make: Leaving directory
> '/home/mpdesouza/git/linux/tools/testing/selftests'

Best Regards,
Petr
