Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFF426292
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 23:22:42 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3214cdb4b27so7102891f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 16:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695684161; x=1696288961; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=syQj6KfneJMPeMndbWwtb34ogcweEEyofyaM1Ofciq4=;
        b=gSFSGzfSThN7TJkY13pBLpbd0fJCbYvzB4cAXGX+3NlRy2vnByypc56FjvRQmgcE9N
         r0zrhD8fOmsqyYZrG7pzTeVYJg5NeFoyoHP1TwGqdVR1LzrXLuZca6zyvE0rnMv8edvv
         fXWm1EpaNZhzXEYeHZixHb07mTke/aKy1V1o3ooxfBOQ1o9MjqFAn/2mwNhwolwK5PxF
         4qDvnVHykKZG4CkAJyRA1KTDrPmgHVnE6gggaN8f6i37BUvULEPF00/xZFP5YhBnPtju
         1eBdlkhRAb8kMvFF/k0gShTwfWQw3+RT4o0niy9GobqMiGY4oY3jmVx78lf9V1qa8xuy
         U4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695684161; x=1696288961;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syQj6KfneJMPeMndbWwtb34ogcweEEyofyaM1Ofciq4=;
        b=JYkqXxe6ltsW+fkYHpxEF0Ld//qZqPzqRvkP64qSQhCBQeR8BREnyfUAkQtPHMVjkW
         /gBtPDbqyrl3dfDOSbeNSX06vlLbjifCH0gCSYdOA+03luMVFBassD9gFLfopqj2S215
         RSw/gHUZzdwmZOau9425mFSPgYZkCt3TeraG4HFf0sEqJJxO4XsY1uU+ND0boF1RV9yT
         0DcyTPNSVdC6qEt5Ct1TN7EPvR/PYSKIZ3Vv9R68A682uo2TxQdWDODA6b8sLYfOUgO+
         pZFaQ784+OsgI3Mky0psDFBcd9wFzawBddTf3gD0N3UeJWri42j5dZOkrI8RctCjQeN3
         VWPw==
X-Gm-Message-State: AOJu0YxqCqsxi6aRZiKhGwgntyswreQL1I3kLSTvyzduFg7bgYve5dsZ
	1pgwN0v11PCucrHW0quK58I=
X-Google-Smtp-Source: AGHT+IHSuhNnxPA2Pst4nNr9AZz7Txt+LBwHVjWmp68U5InlD4WPtIfqhnY6cYKGdddAp6AabWwxmQ==
X-Received: by 2002:a5d:4e0b:0:b0:320:1d1:71c4 with SMTP id p11-20020a5d4e0b000000b0032001d171c4mr7108169wrt.23.1695684160405;
        Mon, 25 Sep 2023 16:22:40 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id c10-20020a5d4f0a000000b0031f3ad17b2csm13015091wru.52.2023.09.25.16.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 16:22:39 -0700 (PDT)
Message-ID: <6512163f.5d0a0220.e4212.8150@mx.google.com>
X-Google-Original-Message-ID: <ZRIWOwTlnIF7MrRE@Ansuel-xps.>
Date: Tue, 26 Sep 2023 01:22:35 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: drivers/leds/trigger/ledtrig-netdev.c:120:34: warning: array
 subscript 17 is above array bounds of 'char[16]'
References: <202309192035.GTJEEbem-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309192035.GTJEEbem-lkp@intel.com>

On Tue, Sep 19, 2023 at 08:21:03PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   2cf0f715623872823a72e451243bbf555d10d032
> commit: 28a6a2ef18ad840a390d519840c303b03040961c leds: trigger: netdev: refactor code setting device name
> date:   4 months ago
> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230919/202309192035.GTJEEbem-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309192035.GTJEEbem-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309192035.GTJEEbem-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/leds/trigger/ledtrig-netdev.c: In function 'set_device_name':
> >> drivers/leds/trigger/ledtrig-netdev.c:120:34: warning: array subscript 17 is above array bounds of 'char[16]' [-Warray-bounds=]
>      120 |         trigger_data->device_name[size] = 0;
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>    drivers/leds/trigger/ledtrig-netdev.c:48:14: note: while referencing 'device_name'
>       48 |         char device_name[IFNAMSIZ];
>          |              ^~~~~~~~~~~
> >> drivers/leds/trigger/ledtrig-netdev.c:120:34: warning: array subscript 17 is above array bounds of 'char[16]' [-Warray-bounds=]
>      120 |         trigger_data->device_name[size] = 0;
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>    drivers/leds/trigger/ledtrig-netdev.c:48:14: note: while referencing 'device_name'
>       48 |         char device_name[IFNAMSIZ];
>          |              ^~~~~~~~~~~
> 
> 
> vim +120 drivers/leds/trigger/ledtrig-netdev.c
> 
> 06f502f57d0d77 Ben Whitten       2017-12-10  106  
> 28a6a2ef18ad84 Andrew Lunn       2023-05-29  107  static int set_device_name(struct led_netdev_data *trigger_data,
> 28a6a2ef18ad84 Andrew Lunn       2023-05-29  108  			   const char *name, size_t size)
> 06f502f57d0d77 Ben Whitten       2017-12-10  109  {
> 06f502f57d0d77 Ben Whitten       2017-12-10  110  	cancel_delayed_work_sync(&trigger_data->work);
> 06f502f57d0d77 Ben Whitten       2017-12-10  111  
> d1b9e1391ab2dc Christian Marangi 2023-04-19  112  	mutex_lock(&trigger_data->lock);
> 06f502f57d0d77 Ben Whitten       2017-12-10  113  
> 06f502f57d0d77 Ben Whitten       2017-12-10  114  	if (trigger_data->net_dev) {
> 06f502f57d0d77 Ben Whitten       2017-12-10  115  		dev_put(trigger_data->net_dev);
> 06f502f57d0d77 Ben Whitten       2017-12-10  116  		trigger_data->net_dev = NULL;
> 06f502f57d0d77 Ben Whitten       2017-12-10  117  	}
> 06f502f57d0d77 Ben Whitten       2017-12-10  118  
> 28a6a2ef18ad84 Andrew Lunn       2023-05-29  119  	memcpy(trigger_data->device_name, name, size);
> 909346433064b8 Rasmus Villemoes  2019-03-14 @120  	trigger_data->device_name[size] = 0;
> 06f502f57d0d77 Ben Whitten       2017-12-10  121  	if (size > 0 && trigger_data->device_name[size - 1] == '\n')
> 06f502f57d0d77 Ben Whitten       2017-12-10  122  		trigger_data->device_name[size - 1] = 0;
> 06f502f57d0d77 Ben Whitten       2017-12-10  123  
> 06f502f57d0d77 Ben Whitten       2017-12-10  124  	if (trigger_data->device_name[0] != 0)
> 06f502f57d0d77 Ben Whitten       2017-12-10  125  		trigger_data->net_dev =
> 06f502f57d0d77 Ben Whitten       2017-12-10  126  		    dev_get_by_name(&init_net, trigger_data->device_name);
> 06f502f57d0d77 Ben Whitten       2017-12-10  127  
> e2f24cb1b5daf9 Christian Marangi 2023-04-19  128  	trigger_data->carrier_link_up = false;
> 06f502f57d0d77 Ben Whitten       2017-12-10  129  	if (trigger_data->net_dev != NULL)
> e2f24cb1b5daf9 Christian Marangi 2023-04-19  130  		trigger_data->carrier_link_up = netif_carrier_ok(trigger_data->net_dev);
> 06f502f57d0d77 Ben Whitten       2017-12-10  131  
> 06f502f57d0d77 Ben Whitten       2017-12-10  132  	trigger_data->last_activity = 0;
> 06f502f57d0d77 Ben Whitten       2017-12-10  133  
> 06f502f57d0d77 Ben Whitten       2017-12-10  134  	set_baseline_state(trigger_data);
> d1b9e1391ab2dc Christian Marangi 2023-04-19  135  	mutex_unlock(&trigger_data->lock);
> 06f502f57d0d77 Ben Whitten       2017-12-10  136  
> 28a6a2ef18ad84 Andrew Lunn       2023-05-29  137  	return 0;
> 28a6a2ef18ad84 Andrew Lunn       2023-05-29  138  }
> 28a6a2ef18ad84 Andrew Lunn       2023-05-29  139  
> 
> :::::: The code at line 120 was first introduced by commit
> :::::: 909346433064b8d840dc82af26161926b8d37558 leds: trigger: netdev: use memcpy in device_name_store
> 
> :::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> :::::: CC: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Can't repro so I guess this was a false-positive that got fixed? (I used
the repro commands and doesn't print any error)

-- 
	Ansuel
