Content-Type: multipart/mixed; boundary="===============8975716531787455409=="
MIME-Version: 1.0
From: Mike Snitzer <snitzer@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [dm:for-next 53/58] drivers/md/dm-zoned-metadata.c:779:3: error: implicit declaration of function 'export_uuid'
Date: Fri, 15 May 2020 10:32:55 -0400
Message-ID: <20200515143254.GA5098@redhat.com>
In-Reply-To: <a1e65e5a-4b23-6c6e-d52f-7bf6eb69e7c8@suse.de>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8975716531787455409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 15 2020 at  3:25am -0400,
Hannes Reinecke <hare@suse.de> wrote:

> Hi Mike,
> =

> This is cause by missing commit d01cd62400b3 ("uuid: Add inline
> helpers to import / export UUIDs"), which went into 5.7.
> Mind to update your tree?

Rebased on v5.7-rc5, thanks

--===============8975716531787455409==--

