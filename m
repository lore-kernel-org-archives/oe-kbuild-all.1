Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D3417E6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 10:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674210083; x=1705746083;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5yxAqjfiGWhzAaV5tb1/aoh4K/2VFkiTET4f2w0RHIU=;
  b=ARD1PP0AuE0wXjPJwjHW/1h2JdudaAgByu+qpYkhI4uyoXjqXl749wV2
   MA4ffek+9n471du60KFTpWbbZKgYH5gniagzR3OLSOe/DyuXfV8h/Xg7u
   QWvWuVg3cUQmLbAQpXX4O/hrX3JucVmQ8tADGgTLKPnUg1cEAdffoxZ0T
   4JsYTvHHuKvAXnDZdobD0I3M9+g82a1bSEWOgs13OBQY61L87zCuVkprq
   YB71agp2ywwGKqwklS7n/zJF7A7zJEpoU0AjKVjyQEjG+JVC1Aokdbwg3
   DSV2G2aEyAwKSx6R5+JrR6gGfFB9Vc/XSngxv7DePAzWsCUXxqFgOx4Uq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="326827429"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="326827429"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 02:21:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="723906651"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="723906651"
Received: from karenodx-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.29.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 02:21:19 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	error27@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mm@kvack.org,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH] ASoC: SOF: sof-audio: prepare_widgets: Check swidget for NULL on sink failure
Date: Fri, 20 Jan 2023 12:21:25 +0200
Message-Id: <20230120102125.30653-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the swidget is NULL we skip the preparing of the widget and jump to
handle the sink path of the widget.
If the prepare fails in this case we would undo the prepare but the swidget
is NULL (we skipped the prepare for the widget).

To avoid NULL pointer dereference in this case we must check swidget
against NULL pointer once again.


Fixes: 0ad84b11f2f8 ("ASoC: SOF: sof-audio: skip prepare/unprepare if swidget is NULL")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index f17d405a9da9..2dff3ae25d27 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -334,7 +334,8 @@ sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget
 			p->walking = false;
 			if (ret < 0) {
 				/* unprepare the source widget */
-				if (widget_ops[widget->id].ipc_unprepare && swidget->prepared) {
+				if (widget_ops[widget->id].ipc_unprepare &&
+				    swidget && swidget->prepared) {
 					widget_ops[widget->id].ipc_unprepare(swidget);
 					swidget->prepared = false;
 				}
-- 
2.39.0

