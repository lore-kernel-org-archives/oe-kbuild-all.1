Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ED453A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Dec 2022 22:21:39 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id l29so24949446edj.7
        for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Dec 2022 14:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hle+TDATQIU1Askkn4DbGJTqJ4zXSQMnec43tQ4/jZM=;
        b=pQjylaZeRgk7uiDrvcyHFI7v06Vkc4qYEz1sL4qhHWKyOG7j3/B4mlriifLexhP5i+
         7yOyTJsn5HAVPenSBmL0iCVKR1nz7/T441J2DXRAqECS0k2qh2ORq5kxz6nBBLTZVjPp
         xHTztE1E/QrZpd/dz/LBALd98yiUpQK6OkuaNfYyYXfD58eRk+WJLBo8yIj2LCXqgbz0
         8Jxw9NXkH0F3GoHYgtzIHgzBMnImtrFzXlD7dmylHROXvkxDXpUFqoQdg6Ma7bn0DLEH
         CjKDAm+YPD8Nu0q6iXWp+n+8AYghzBtEZNUBhsATebbyQQo1PXT8gaNxcAeZccu+Qgpa
         eNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hle+TDATQIU1Askkn4DbGJTqJ4zXSQMnec43tQ4/jZM=;
        b=L/47WJnR+NZm+Qtp5jNzcqPrMfZmon6rEJR763zhA1YHufM1Gaf1Cd5i7N2GjqBT7F
         nbBCEzB3Rp8fZP7AHOlvFkqCZfUxC+mP7gXomK7Gww9E7VIHc9LNnNh223E57KyTEb5X
         1RXuJZyfz63lDslHeNbwzpBsi7RKUVtmXskNddyYolMwmvGewmyPGdt6vqiRqydS8RUZ
         n3aLhg2PvAEyIKCVyJH9Nu0rDm46e0z1Yp+Xh1D3mHXYWDtwETNIwmCOA6aW4sKYXDHs
         bbEkhV5Uu45Q1e/lD0swKVUhrJUc/RsSz1pW3qdrreWO101iQ91R0R7o+4xFW+PNw9Pp
         za/A==
X-Gm-Message-State: AFqh2kpc3E2zaUWZ4EhJvPcKiKcQE/BXDjzrK35KpCU2O81TUXlNJKFH
	s8+MG+hi0IfosKreWP0e/zXn7ijh7XWe+cv/1tc=
X-Google-Smtp-Source: AMrXdXtnCvYktMIZ6BdXm6xSI9y64WwtIfegEr0xSAYsPnxcqa8ZUnuA9r0eLzQ7O6CH3C06/d39LkAOSlUxyS36xbE=
X-Received: by 2002:a50:ea81:0:b0:45c:a651:8849 with SMTP id
 d1-20020a50ea81000000b0045ca6518849mr3712707edo.209.1672438898126; Fri, 30
 Dec 2022 14:21:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221230215942.3241955-1-zenczykowski@gmail.com> <Y69fx1KpwWivqLp0@181616e551cc>
In-Reply-To: <Y69fx1KpwWivqLp0@181616e551cc>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Date: Fri, 30 Dec 2022 14:21:26 -0800
Message-ID: <CAHo-Ooxx2qF0i-34H3mCMB99_Uf1ifnw2ivs9z4AHkbSPXsY9Q@mail.gmail.com>
Subject: Re: [PATCH] usb: storage: de-quirk Seagate Expansion Portable Drive
 SRD00F1 [0bc2:2320]
To: kernel test robot <lkp@intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Mr. Robot,

your rule matching logic appears to be incorrectly implemented.

Regards,

A human.

On Fri, Dec 30, 2022 at 2:02 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi,
>
> Thanks for your patch.
>
> FYI: kernel test robot notices the stable kernel rule is not satisfied.
>
> Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
> Subject: [PATCH] usb: storage: de-quirk Seagate Expansion Portable Drive SRD00F1 [0bc2:2320]
> Link: https://lore.kernel.org/stable/20221230215942.3241955-1-zenczykowski%40gmail.com
>
> The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
>
>
>
