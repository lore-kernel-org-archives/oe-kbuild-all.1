Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA2920310
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 18:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IDqUXsIo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4671C433C7;
	Fri,  8 Dec 2023 18:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1702058720;
	bh=j3o7VBseBhwgHO4H6JE6Dgu3mbVgOTPXyCtJKcdWBGo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IDqUXsIo/wVXwgRoBYjNsaa+AKkE1NciqhZptdcq27c/5fJfM5ckZUtwj0Pgq6G3B
	 8ZBlv4325GDePAja5uxwLYkTwfHc1PcQ7LhbzJ0RPWevzGz9QIPmv3eRSGVs21Var0
	 nJ5iE9KqevmVH7V4NcY26LB0uO7+8g63srSD8GPk=
Date: Fri, 8 Dec 2023 10:05:19 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 5469/6165] uffd-common.c:636:28: warning:
 unused variable 'uffdio_move'
Message-Id: <20231208100519.aa94b349b45e3b7ff25b3eba@linux-foundation.org>
In-Reply-To: <CAJuCfpF_FN07Pvn5BJn1vJMAeEPKRBdfT3kWXVD=WAfizto+UQ@mail.gmail.com>
References: <202312081716.LUUhSNS4-lkp@intel.com>
	<CAJuCfpF_FN07Pvn5BJn1vJMAeEPKRBdfT3kWXVD=WAfizto+UQ@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 8 Dec 2023 09:27:38 -0800 Suren Baghdasaryan <surenb@google.com> wrote:

> On Fri, Dec 8, 2023 at 2:00 AM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23
> > commit: d02321ca0329457d5828a83b82b156e6337c4236 [5469/6165] selftests/mm: add UFFDIO_MOVE ioctl test
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312081716.LUUhSNS4-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202312081716.LUUhSNS4-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> 
> Huh. This is strange. I checked linux-next.git and looks like the
> patch adding the test [1] is there but the one actually adding new
> ioctl [2] is missing (at least I do not see the new definitions in
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/uapi/linux/userfaultfd.h).
> Patches belong to the same series. I'll check what's going on later
> today.
> 
> [1] https://lore.kernel.org/all/20231206103702.3873743-6-surenb@google.com/
> [2] https://lore.kernel.org/all/20231206103702.3873743-3-surenb@google.com/

Thanks.  Seems I messed up some reject resolution.. Fixed now.
