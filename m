Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F2510E8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Dec 2022 07:44:51 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id x66so1130434pfx.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Nov 2022 23:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DmcgvghbSyLETEiIiqLC0sxEJ/RMk6n6/8eL24bWMBs=;
        b=Yx2ZfemFxyoM/0QW/JdyoF0maNAYSQYb8rt1NhRljcp7MKl0ziNJMBJ0SzAY9DIBFl
         aGZrE8tKJ9SWhObnmXg5uXXYKgu8QCM4HIjzcanWq/GaD9yihyUgFLuYHHT3VDX1TLt6
         c3wBULAzz/3QgoQQ/878H7Klbo45sj2drO9XWvhULJIyJCRW9rxgkMtVwIFiZlcBKzkH
         F1zK7us+/cQafcLSbMCVB83ZmwNTEFAtxNlGQtNrRZXfiI+w/xIh5wgbJpA1DVDpu1V1
         36OtLklBASdQc7XxgLMkO7MFW5gnUnYOA/ZMpor3qORLdik4xvNiLNwpi5SRt7n6AHPl
         jbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DmcgvghbSyLETEiIiqLC0sxEJ/RMk6n6/8eL24bWMBs=;
        b=Is0fQ9w1hZ6tY6AkBUwTMMR3f0mixSYwjyT5Hjns4FiPU/qeq4PcPJg7I2f/XaJ6Oe
         BfPh589gMqoKwuIb49uyDY97wmZXz2eOa3PH2s7lr2olawB/ej3sPhxA2Aj3UTq7DRtg
         ik7oupRJ8VuplZGN7Nnc8exqI8pUsBs7o3BdAn3HB1aKO/FcdU/dzEq4QoAO+Tl/9iHd
         fUgBgCcK3pftUuh2j53snEuRV/HbsxpBrhBQnJtY5RwWWQJz9AQIqWGRYhWnI0qUkvuD
         ds6n8d+w/kjXpTkIGw7aEG6Feh1B5/52PEQX1AEVAn3drOr0sxFfIvbYcCW6CBha/Itn
         iWyw==
X-Gm-Message-State: ANoB5pkgfMuvAetdqVgxHw6jTStv3oW489iU2pSehIccs1De92BnaiDa
	2nEpbpeKlEMCQJC8mas50Nz3jwlIoeWWeQhiQdKpyQ==
X-Google-Smtp-Source: AA0mqf49indqv/b5nd3C/0vW+yWfNh9rCi0z795YuXezT342+ZwxuFJxHclerV+exc+YdIOTWvoN6u7KcFy7vV4Ygc4=
X-Received: by 2002:a63:105c:0:b0:46f:f72c:cdae with SMTP id
 28-20020a63105c000000b0046ff72ccdaemr41659653pgq.237.1669880690455; Wed, 30
 Nov 2022 23:44:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221201023204.2177458-3-yunkec@google.com> <202212011503.PQRj8R8e-lkp@intel.com>
In-Reply-To: <202212011503.PQRj8R8e-lkp@intel.com>
From: Yunke Cao <yunkec@google.com>
Date: Thu, 1 Dec 2022 16:44:39 +0900
Message-ID: <CANqU6FfTDK1W3=t3KwXtH=5hVjWeAXsWJsLshuXhtMUDztX_rA@mail.gmail.com>
Subject: Re: [PATCH v10 02/11 RESEND] media: uvcvideo: add uvc_ctrl_get_boundary
 for getting default value
To: kernel test robot <lkp@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, oe-kbuild-all@lists.linux.dev, 
	Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi!

Thanks for the review.

On Thu, Dec 1, 2022 at 4:16 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Yunke,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.1-rc7 next-20221201]
> [cannot apply to media-tree/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yunke-Cao/media-Implement-UVC-v1-5-ROI/20221201-103422
> patch link:    https://lore.kernel.org/r/20221201023204.2177458-3-yunkec%40google.com
> patch subject: [PATCH v10 02/11 RESEND] media: uvcvideo: add uvc_ctrl_get_boundary for getting default value
> config: m68k-allyesconfig
> compiler: m68k-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/bb57965a09e65c4ed0cc01d63e158bba810648b4
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Yunke-Cao/media-Implement-UVC-v1-5-ROI/20221201-103422
>         git checkout bb57965a09e65c4ed0cc01d63e158bba810648b4
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/media/usb/uvc/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    drivers/media/usb/uvc/uvc_ctrl.c: In function 'uvc_ctrl_get_boundary':
> >> drivers/media/usb/uvc/uvc_ctrl.c:1788:73: warning: passing argument 4 of '__uvc_ctrl_get_boundary_std' makes integer from pointer without a cast [-Wint-conversion]
>     1788 |                 ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
>          |                                                                         ^~~~~
>          |                                                                         |
>          |                                                                         struct v4l2_ext_control *
>    drivers/media/usb/uvc/uvc_ctrl.c:1755:44: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'struct v4l2_ext_control *'
>     1755 |                                        u32 v4l2_which,
>          |                                        ~~~~^~~~~~~~~~

1755 |                                        u32 v4l2_which,

This parameter should have been added as part of patch 10/11 instead
of here. Sorry!
Will fix it in the next version.

>    drivers/media/usb/uvc/uvc_ctrl.c:1788:23: error: too few arguments to function '__uvc_ctrl_get_boundary_std'
>     1788 |                 ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
>          |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/media/usb/uvc/uvc_ctrl.c:1752:12: note: declared here
>     1752 | static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
>          |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +/__uvc_ctrl_get_boundary_std +1788 drivers/media/usb/uvc/uvc_ctrl.c
>
>   1768
>   1769  int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
>   1770                            struct v4l2_ext_control *xctrl)
>   1771  {
>   1772          struct uvc_control *ctrl;
>   1773          struct uvc_control_mapping *mapping;
>   1774          int ret;
>   1775
>   1776          if (mutex_lock_interruptible(&chain->ctrl_mutex))
>   1777                  return -ERESTARTSYS;
>   1778
>   1779          ctrl = uvc_find_control(chain, xctrl->id, &mapping);
>   1780          if (!ctrl) {
>   1781                  ret = -EINVAL;
>   1782                  goto done;
>   1783          }
>   1784
>   1785          if (uvc_ctrl_mapping_is_compound(mapping))
>   1786                  ret = -EINVAL;
>   1787          else
> > 1788                  ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
>   1789
>   1790  done:
>   1791          mutex_unlock(&chain->ctrl_mutex);
>   1792          return ret;
>   1793  }
>   1794
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
