Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630507E9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 04:44:45 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id cq23so49062248edb.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 20:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677645883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hNd1OK1QFV9reDtXSoqn1wg/UMDolyTcsTNSvqVjdGk=;
        b=A+Uc5SDiTXFuxSLjHGEOkRfZ5ebcgv6MKOvyGFW+Vf2nNGpmmlJ2gsBcD8CEEr/fjB
         SLYgZW1c9LbV04Di9Ek0DShddm9Gw2wX/tshh2FPTR88BrSGwbBQu5L4hvKCGCzDq8Ti
         2iRCXTigRJkWEfgZEJhEJlZL9rD16dterA6Qz0FNY9BKYl+TSORmu+RYOzzHr8s/bUP5
         3U9FyTT8Gf7Z6cScRo1NHFgLdCCz4mdG0/U8FnXA2Jn1bZeij8/BL7CnWIdOJuh6VyeB
         BVOjru8x1xlylqCYz210xbZUrF53jGwY3scjWq5HqQ5OxgNqq3oaxnSrTBUcWO68hwaS
         opDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677645883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNd1OK1QFV9reDtXSoqn1wg/UMDolyTcsTNSvqVjdGk=;
        b=CkirCkxRtCLd6mJWsKqwCoc0z5kE9TFIWbTJbM4oPdIK1K4Ug/9xCKuMkDXZHuBR/o
         ojwJIMcHPaAYUJNPrhUERius1EThZ24pWd+kPjSX6sTxL4m8KLCbcmMekAemjFUolCDH
         vwlDbctscYh0zaaM7aIX9lRIHVd6C4QGzx4rU5qTE1XWFOAFpGQfF8HxUqz2OqcRi+sx
         Ij0pQKDlb1E5DhfXNv0DMi4ZBidROdfUx3VBMHPrdH+s8FW7OQYG+gHFe9xnvdmTB4dv
         EPUwRcvpY1keHXUtYGydcgJt0Jf5mEnm1jgO9yEIJFHZF/hW1nZB80joSaLYwSSzmERp
         BCtw==
X-Gm-Message-State: AO0yUKUwF7EbK4PaRSBGn4DO9UOp8l7lTllkmUfHVzHIZF7UYC7TKWDu
	gnPP3lSPKB0NUk0CBNypA9E=
X-Google-Smtp-Source: AK7set9RO586m6Z9KVEeVGhMXh9EhrasPxZ5y1k2Y7SX5+Jbzu0BTiaSe9Ek+88gp2KB3p3RSFG2+A==
X-Received: by 2002:a17:907:9687:b0:8b1:75a0:57fa with SMTP id hd7-20020a170907968700b008b175a057famr6865779ejc.43.1677645883430;
        Tue, 28 Feb 2023 20:44:43 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u4-20020a170906068400b008f883765c98sm5356071ejb.14.2023.02.28.20.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 20:44:43 -0800 (PST)
Date: Wed, 1 Mar 2023 07:44:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: drivers/pci/pcie/../pci.h:325:17: sparse: sparse: cast from
 restricted pci_channel_state_t
Message-ID: <Y/7YN7U9Q2iqNDFo@kadam>
References: <202303010454.jI5Jg2sT-lkp@intel.com>
 <20230228213325.GA21769@wunner.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228213325.GA21769@wunner.de>

Hi Lukas,

I do smatch, not sparse.  Sparse maintainers are on
linux-sparse@vger.kernel.org.

On Tue, Feb 28, 2023 at 10:33:25PM +0100, Lukas Wunner wrote:
> Hi Dan,
> 
> 0-day is reporting sparse warnings introduced by commit 74ff8864cc84
> ("PCI: hotplug: Allow marking devices as disconnected during
> bind/unbind"), which landed in Linus' tree this week.
> 
> The warnings are caused by invocations of xchg() and cmpxchg()
> on an enum type ("cast from restricted pci_channel_state_t").

pci_channel_state_t is not an enum.  The problem is the __bit_wise.

> 
> It seems they are only reported for architectures whose arch_xchg()
> and arch_cmpxchg() macros cast the argument to an unsigned long.
> Archictures such as x86 don't do that, but a number of others do.
> The 0-day report, reproduced below in full, is for loongarch.
> 
> I'm wondering why the cast is necessary at all.  Digging in the
> git history, I noticed that it has existed at least on arm since
> forever.  I suspect that its use on newer arches such as loongarch
> may be due to cargo-culting.
> 

Speaking as an absolutely newbie and ignoramous, I can't see any point
to the cast in arch_xchg().  But I am also surprised that silences the
warning.  I would have thought that removing the cast would change the
warning from "warning: cast from restricted my_type_t" to
"warning: incorrect type in argument 1 (different base types)".

> Please advise whether these sparse warnings are false positives which
> can be ignored and if they aren't, how to resolve them.  If you happen
> to know the rationale for the cast, I'd be grateful if you could shed
> some light on it.  Thanks a lot!

The question is more why is pci_channel_state_t declared as __bit_wise.
__bit_wise data can only be used through accessor functions, like user
pointers have to go through copy_from_user() and endian data has to go
through le32_to_cpu() etc.

I don't know the answer to that though.

regards,
dan carpenter

> 
> 
> On Wed, Mar 01, 2023 at 04:39:24AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   e492250d5252635b6c97d52eddf2792ec26f1ec1
> > commit: 74ff8864cc842be994853095dba6db48e716400a PCI: hotplug: Allow marking devices as disconnected during bind/unbind
> > date:   13 days ago
> > config: loongarch-randconfig-s042-20230226 (https://download.01.org/0day-ci/archive/20230301/202303010454.jI5Jg2sT-lkp@intel.com/config)
> > compiler: loongarch64-linux-gcc (GCC) 12.1.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # apt-get install sparse
> >         # sparse version: v0.6.4-39-gce1a6720-dirty
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=74ff8864cc842be994853095dba6db48e716400a
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout 74ff8864cc842be994853095dba6db48e716400a
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202303010454.jI5Jg2sT-lkp@intel.com/
> > 
> > sparse warnings: (new ones prefixed by >>)
> >    drivers/pci/pcie/err.c: note: in included file:
> > >> drivers/pci/pcie/../pci.h:325:17: sparse: sparse: cast from restricted pci_channel_state_t
> > >> drivers/pci/pcie/../pci.h:325:17: sparse: sparse: cast to restricted pci_channel_state_t
> >    drivers/pci/pcie/../pci.h:328:23: sparse: sparse: cast from restricted pci_channel_state_t
> >    drivers/pci/pcie/../pci.h:328:23: sparse: sparse: cast from restricted pci_channel_state_t
> >    drivers/pci/pcie/../pci.h:328:23: sparse: sparse: cast to restricted pci_channel_state_t
> >    drivers/pci/pcie/../pci.h:332:23: sparse: sparse: cast from restricted pci_channel_state_t
> >    drivers/pci/pcie/../pci.h:332:23: sparse: sparse: cast from restricted pci_channel_state_t
> >    drivers/pci/pcie/../pci.h:332:23: sparse: sparse: cast to restricted pci_channel_state_t
> > >> drivers/pci/pcie/../pci.h:325:17: sparse: sparse: cast to restricted pci_channel_state_t
> >    drivers/pci/pcie/../pci.h:328:23: sparse: sparse: cast to restricted pci_channel_state_t
> >    drivers/pci/pcie/../pci.h:332:23: sparse: sparse: cast to restricted pci_channel_state_t
> > 
> > vim +325 drivers/pci/pcie/../pci.h
> > 
> >    306	
> >    307	/**
> >    308	 * pci_dev_set_io_state - Set the new error state if possible.
> >    309	 *
> >    310	 * @dev: PCI device to set new error_state
> >    311	 * @new: the state we want dev to be in
> >    312	 *
> >    313	 * If the device is experiencing perm_failure, it has to remain in that state.
> >    314	 * Any other transition is allowed.
> >    315	 *
> >    316	 * Returns true if state has been changed to the requested state.
> >    317	 */
> >    318	static inline bool pci_dev_set_io_state(struct pci_dev *dev,
> >    319						pci_channel_state_t new)
> >    320	{
> >    321		pci_channel_state_t old;
> >    322	
> >    323		switch (new) {
> >    324		case pci_channel_io_perm_failure:
> >  > 325			xchg(&dev->error_state, pci_channel_io_perm_failure);
> >    326			return true;
> >    327		case pci_channel_io_frozen:
> >    328			old = cmpxchg(&dev->error_state, pci_channel_io_normal,
> >    329				      pci_channel_io_frozen);
> >    330			return old != pci_channel_io_perm_failure;
> >    331		case pci_channel_io_normal:
> >    332			old = cmpxchg(&dev->error_state, pci_channel_io_frozen,
> >    333				      pci_channel_io_normal);
> >    334			return old != pci_channel_io_perm_failure;
> >    335		default:
> >    336			return false;
> >    337		}
> >    338	}
> >    339	
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests
