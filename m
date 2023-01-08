Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECEB1C3C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Jan 2023 07:36:30 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id 192so305557pfz.4
        for <oe-kbuild-all@lists.linux.dev>; Sat, 07 Jan 2023 23:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=solid-run-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5gZx3siaJR6JKl76sL9+DDCT7shPNYCYgnUomc+hd4=;
        b=A1vozl9uUms+0a1C6BcP0Oj4n8VXl5yFx+kMoZAPSQLke7oTDE0DPNlL4uFkwN4d1j
         CHu8JjikWlu/HfWLw8Wu8D1NTlELuqCroG6qe7YN/48B+SsFpb9/WGynCFnQpmFVyTTX
         TN7Vxt9ZaflVa5rz4RKAldct1mKM5T7fTta2Imex9bcdUyXK/aGNlxcRKGeu3G+R7Iwk
         Uqf8SOuSYV/3BcnzWLa/FEmgQlCtWv+Pnsb93PaPsBn2s0JT1TRNWUykKOy/MH9OvT5P
         0pc+6MTefCnKTwSEazfZZ70W7ITNWO+0THRHfnS5ES+sSYtHtbP0K+YRT3cac9wcc8vc
         UcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5gZx3siaJR6JKl76sL9+DDCT7shPNYCYgnUomc+hd4=;
        b=Dz+eQEoZwgZrm8CzrHsQmN1hHoF2D4Ya3uns6n7lM2uVUjW4HUs0ZmAtCNU0VxCGs4
         IJMyGhkn7DFK8Z+obgki1F+hBuMOpRf9x0FmWm9PB/fcTHHVoo565WiDGNc3LgUQLyXD
         c1aWSjJb66FHjDlUs8wbOXdz9RoHBVHS3s3crsdfcNi/b7hvOmQLqFf9R3y/Jy+oZgBM
         dtzjTS9nKxlmkqU1JPFIkngse4sllDMaaWsc0L211Epr765tKaMtyWefU6pLKY+1dII2
         2HexduDZzHAZUjDETtADI1s59nPojrmMTw73Gr8afUm0vY2iG26mHlVMuW8qkxsFBLdi
         IjBw==
X-Gm-Message-State: AFqh2krb+wGyHVxNN3W01fvlI3qWG3Yp9kr2J+rB93nj7Kv+zsxe8oUZ
	MGdhwz1oct0La1r5s9ZepfPL9EwKS2/jKuxZIE5gWQ==
X-Google-Smtp-Source: AMrXdXtYc4nrZVVSoYlEPgaGvZic+TRgCl4FvOy5sHeRTowZ6vPVyBkkTLJ1ihNPo/m9hHFQ0HuQyEFb3FUKTNFXk28=
X-Received: by 2002:a63:eb07:0:b0:4ad:2049:2aa6 with SMTP id
 t7-20020a63eb07000000b004ad20492aa6mr378197pgh.550.1673163390064; Sat, 07 Jan
 2023 23:36:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202301062204.7kxE888T-lkp@intel.com>
In-Reply-To: <202301062204.7kxE888T-lkp@intel.com>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Sun, 8 Jan 2023 09:35:53 +0200
Message-ID: <CAJs=3_Dv=q77=OcuGX4cyL3MhZuqn+ygSk_t+p=ApRc4CEkGGw@mail.gmail.com>
Subject: Re: [linux-next:master 1416/3037] drivers/vdpa/solidrun/snet_vdpa.h:193:6:
 warning: no previous prototype for 'psnet_create_hwmon'
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

I'll send a patch to fix this shortly.
